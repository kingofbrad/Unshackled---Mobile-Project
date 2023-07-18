//
//  EmojiViewModel.swift
//  Unshackled
//
//  Created by Bradlee King on 06/04/2023.
//

import Foundation
import SwiftUI

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
