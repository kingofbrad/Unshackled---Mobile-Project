//
//  MainJournalView.swift
//  Unshackled
//
//  Created by Bradlee King on 01/11/2022.
//

import SwiftUI

struct Journal {
    let title: String
    let text: String
    let mood: String
}




class JournalViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var journal: Journal?
    
    
    
    init() {
        fetchUserJournal()
    }
    
    func fetchUserJournal() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find User uid"
            return
        }
        
        
        FirebaseManager.shared.firestore.collection("users").document(uid).collection("entry").document().getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch user entry \(error)"
                print("Failed to fetch user Entry \(error)")
                return
            }
            
            
            guard let data = snapshot?.data() else
            {
                self.errorMessage = "No Data Found"
                return
            }
            let entryID = data["id"] as? String ?? ""
            let title = data["title"] as? String ?? ""
            let text = data["text"] as? String ?? ""
            let mood = data["mood"] as? String ?? ""
            
            self.journal = Journal(title: title, text: text, mood: mood)
            
            self.errorMessage = "Successfully got the Data"
            
        }
    }
}


struct MainJournalView: View {
    @State private var showingSheet = false
    @ObservedObject var vm: JournalViewModel
    
    var body: some View {
        NavigationStack{
            Text(vm.errorMessage)
            
            ScrollView {
                ForEach(0..<10) { entry in
                    JournalCellView(vm: JournalViewModel())
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
            Add_EditJournalView(vm: JournalViewModel())
        }
    }
    
    
    
}

struct MainJournalView_Previews: PreviewProvider {
    static var previews: some View {
        MainJournalView(vm: JournalViewModel())
    }
}
