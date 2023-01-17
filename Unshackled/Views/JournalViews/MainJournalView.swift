//
//  MainJournalView.swift
//  Unshackled
//
//  Created by Bradlee King on 01/11/2022.
//

import SwiftUI
import Firebase

struct FirebaseConstantsJournal {
    static let fromId = "fromId"
    static let title = "title"
    static let text = "text"
    static let mood = "mood"
    static let timestamp = "timestamp"
}

struct Journal: Identifiable {
    var id: String {documentId}
    
    
    
    let documentId: String
    let fromId, text, title, mood: String
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.fromId = data[FirebaseConstantsJournal.fromId] as? String ?? ""
        self.title = data[FirebaseConstantsJournal.title] as? String ?? ""
        self.text = data[FirebaseConstantsJournal.text] as? String ?? ""
        self.mood = data[FirebaseConstantsJournal.mood] as? String ?? ""
    }
}

class JournalViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var journal = [Journal]()
    
    @Published var NoEntryfound = true
    @Environment (\.dismiss) private var dismiss
    init() {
        fetchUserJournal()
    }
    
    private func fetchUserJournal() {
        guard let fromUid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find User uid"
            return
        }
        FirebaseManager.shared.firestore
            .collection("journals")
            .document(fromUid)
            .collection("entry")
            .order(by: "timestamp")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "failed to fetch user journal \(error)"
                    print("failed to fetch user journal \(error)")
                    self.NoEntryfound = true
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        self.journal.append(.init(documentId: change.document.documentID, data: data))
                    }
                })
                
                self.errorMessage = "Successfully got the Data"
                print(self.errorMessage)
                self.NoEntryfound = false
                
            }
    }
    
    func handleAddEntry(text: String, title: String, mood: String) {
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else {return}
        
        let document = FirebaseManager.shared.firestore
            .collection("journals")
            .document(fromId)
            .collection("entry")
            .document()
        
        let journalData = [
            FirebaseConstantsJournal.fromId: fromId, FirebaseConstantsJournal.text: text, FirebaseConstantsJournal.title: title,
            FirebaseConstantsJournal.mood: mood,
            "timestamp": Timestamp()
        ] as [String: Any]
        
        document.setData(journalData) {error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save entry into Firestore: \(error)"
                return
            }
            self.errorMessage = "Successfully saved current user adding Journal entry"
            print("Successfully saved current user adding Journal Entry")
        }
        
    }
}


struct MainJournalView: View {
    @State private var showingSheet = false
    @ObservedObject var jvm: JournalViewModel
    
    
   
    
    var body: some View {
        NavigationStack{
            Text(jvm.errorMessage)
                .padding(.bottom, 15)
            EntryButton

            ScrollView {
                VStack {
                    ForEach(jvm.journal) {entry in
                        journalDataView(entry: entry, jvm: JournalViewModel())
                    }
                }
            }
            .navigationTitle("Journal")
            .toolbar{EntryButton}
        }
    }
    
    
    
    var EntryButton: some View {
        Button {
            showingSheet.toggle()
            
        } label: {
            Image(systemName: "plus")
        }
        .sheet(isPresented: $showingSheet ) {
            Add_EditJournalView(jvm: JournalViewModel())
        }
    }
    
    
    
}

struct journalDataView: View {
    let entry: Journal
    @ObservedObject var jvm: JournalViewModel
    @State private var isAddJournalOpen: Bool = false
    var body: some View {
        VStack {
            if entry.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                if !jvm.NoEntryfound {
                    VStack {
                        Text(entry.title)
                        Text(entry.text)
                    }
                    .padding(.horizontal)
                    .frame(width:400, height: 300)
                    .background(Color.red)
                    
                } else {
                    VStack{
                        Text("Please add a new entry")
                    }
                }
                
            }
           
        }
    }
}

struct MainJournalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainJournalView(jvm: JournalViewModel())
        }
    }
}
