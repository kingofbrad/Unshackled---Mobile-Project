//
//  Add:EditJournalView.swift
//  Unshackled
//
//  Created by Bradlee King on 01/11/2022.
//

import SwiftUI

struct Add_EditJournalView: View {
   
    @ObservedObject var vm: JournalViewModel
    @State var errorMessage = ""
    @State private var title = ""
    @State private var text = ""
    @State private var mood = ""
    
    var body: some View {
        VStack(spacing: 3) {
            TextField("Title", text: $title)
                .padding(12)
                
            TextField("Text",text: $text)
                .padding(12)
            TextField("Mood", text: $mood)
                .padding(12)
            
            Button{
                storeUserEntry()
            } label: {
                Text("Add Entry")
            }
            
            Text(errorMessage)
                .foregroundColor(.red)
        }
    }
    func storeUserEntry() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
       
        let userData = ["title": self.title, "text": self.text, "mood": self.mood]
        FirebaseManager.shared.firestore.collection("users").document(uid).collection("entry").document().setData(userData) {err in
            if let err = err {
                self.errorMessage = "cannot store user entry \(err)"
                print(err)
                return
            }
            self.errorMessage = "successfully stored data \(userData)"
        }
    }
}

struct Add_EditJournalView_Previews: PreviewProvider {
    static var previews: some View {
        Add_EditJournalView(vm: JournalViewModel())
    }
}
