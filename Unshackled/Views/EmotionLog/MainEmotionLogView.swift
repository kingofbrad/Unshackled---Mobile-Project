//
//  MainEmotionLogView.swift
//  Unshackled
//
//  Created by Bradlee King on 15/02/2023.
//

import SwiftUI
import UIKit
import Firebase

struct FirebaseConstantsEmoji {
    static let fromId = "fromId"
    static let text = "text"
    static let mood = "mood"

}

struct Emojis: Identifiable, Hashable {
    var id: String {documentId}
    let documentId: String
    let fromId, text, mood: String
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.fromId = data[FirebaseConstantsEmoji.fromId] as? String ?? ""
        self.mood = data[FirebaseConstantsEmoji.mood] as? String ?? ""
        self.text = data[FirebaseConstantsEmoji.text] as? String ?? ""
    }
}

class EmojiViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var emoji = [Emojis]()
    
    @Published var NoEntryfound = true
    @Environment (\.dismiss) private var dismiss
    init() {
        fetchUserMoods()
    }
    
    
    func handleAddEntry(text: String, mood: String) {
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else {return}
        
        let document = FirebaseManager.shared.firestore
            .collection("moods")
            .document(fromId)
            .collection("emoji")
            .document()
        
        let MoodData = [
            FirebaseConstantsJournal.fromId: fromId, FirebaseConstantsJournal.text: text,
            FirebaseConstantsJournal.mood: mood
        ] as [String: Any]
        
        document.setData(MoodData) {error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save entry into Firestore: \(error)"
                return
            }
            self.errorMessage = "Successfully saved current user adding Journal entry"
            print("Successfully saved current user adding Journal Entry")
        }
        
    }
    private func fetchUserMoods() {
        guard let fromUid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find User uid"
            return
        }
        FirebaseManager.shared.firestore
            .collection("moods")
            .document(fromUid)
            .collection("emoji")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "failed to fetch user Moods \(error)"
                    print("failed to fetch user Moods \(error)")
                    self.NoEntryfound = true
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        self.emoji.append(.init(documentId: change.document.documentID, data: data))
                    }
                })
                
                self.errorMessage = "Successfully got the Data"
                print(self.errorMessage)
                self.NoEntryfound = false
                
            }
    }
}


struct MainEmotionLogView: View {
    @ObservedObject var evm: EmojiViewModel
    var body: some View {
        NavigationStack {
            VStack{
                // Begining of Title
                HStack {
                    VStack(alignment: .leading) {
                        Text("Emotion Log")
                            .font(.custom("Vidaloka-Regular", size: 40))
                        Text("What have you been up to?")
                            .font(.custom("Poppins-SemiBold", size: 15))
                    }
                    Spacer()
                }
                .padding(.leading, 30)
                HStack(spacing: -20) {
                    ForEach(evm.emoji) { emoji in
                        moodDataView(emoji: emoji, evm: EmojiViewModel())
                        
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightpink"))
            
        }
    }
}

struct ActiviesScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
            }
        }
    }
}

struct MainEmotionLogView_Previews: PreviewProvider {
    static var previews: some View {
        MainEmotionLogView(evm:EmojiViewModel())
    }
}

struct EmojiBtnScrollView: View {
    var image: String
    var emojiBtnFunc: (() -> Void)
    
    var body: some View {
        Button(action: emojiBtnFunc) {
            Image(image)
                .resizable()
                .frame(width: 75, height: 75)
        }
    }
}

struct ActivitesBtnScrollView: View {
    var activitesBtnFunc: (() -> Void)
    var text: String
    var image: String
    
    var body: some View {
        Button(action: activitesBtnFunc) {
            VStack {
                Image(image)
                Text(text)
            }
        }
    }
}


struct moodDataView: View {
    let emoji: Emojis
    @ObservedObject var evm: EmojiViewModel
    @State private var isAddJournalOpen: Bool = false
    var body: some View {
        VStack {
            if emoji.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                if !evm.NoEntryfound {
                    VStack {
                        EmotionBtn(icon: emoji.mood, text: emoji.text) {
                            print("")
                        }
                    }
                    .padding(.horizontal)
                    
                } else {
                    VStack{
                        Text("Please add a new entry")
                    }
                }
                
            }
           
        }
    }
}
