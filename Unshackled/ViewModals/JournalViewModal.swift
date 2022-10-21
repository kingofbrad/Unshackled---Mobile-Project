//
//  JournalViewModal.swift
//  Unshackled
//
//  Created by Bradlee King on 19/10/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class JournalViewModel: ObservableObject {
    @Published var journalEntries = [Entry]()
    
    private var db = Firestore.firestore()
    
    
    
    func fetchData() {
        db.collection("journalEntries").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            
            self.journalEntries = documents.compactMap { (queryDocumentSnapshot) -> Entry? in
                return try? queryDocumentSnapshot.data(as: Entry.self)
                
                
                //                let data = queryDocumentSnapshot.data()
                //
                //                let title = data["title"] as? String ?? ""
                //                let text = data["text"] as? String ?? ""
                //                let mood = data["mood"] as? String ?? ""
                //
                //
                //                return Entry(title: title, text: text, mood: mood )
                
            }
        }
    }
    
    
}


