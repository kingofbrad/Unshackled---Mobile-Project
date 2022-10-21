//
//  EntryViewModel.swift
//  Unshackled
//
//  Created by Bradlee King on 21/10/2022.
//

import Foundation
import Firebase
import Combine

class EntryViewModel: ObservableObject {
    @Published var entry: Entry
    @Published var modified = false
    
    private var db = Firestore.firestore()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(entry: Entry = Entry(title: "", text: "", mood: "")) {
        self.entry = entry
        
        self.$entry
            .dropFirst()
            .sink{[weak self]entry in
                self?.modified = true
            }
            .store(in: &cancellables)
        
    }
    
    func addEntry(entry: Entry) {
        do{
            let _ =  try db.collection("journalEntries").addDocument(from: entry)
        }
        catch {
            print(error)
        }
    }
    
    func save() {
        addEntry(entry: entry)
    }
}
