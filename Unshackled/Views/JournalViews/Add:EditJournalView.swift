//
//  Add:EditJournalView.swift
//  Unshackled
//
//  Created by Bradlee King on 01/11/2022.
//

import SwiftUI

struct Add_EditJournalView: View {
    
    @ObservedObject var jvm: JournalViewModel
    @State private var title = ""
    @State private var text = ""
    @State private var mood = ""
    
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 3) {
                TextField("Title", text: $title)
                    .padding(12)
                
                TextField("Text",text: $text)
                    .padding(12)
                TextField("Mood", text: $mood)
                    .padding(12)
                
                Button{
                    jvm.handleAddEntry(text: text, title: title, mood: mood)
                    dismiss()
                } label: {
                    Text("Add Entry")
                }
                
                Text(jvm.errorMessage)
                    .foregroundColor(.red)
            }
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Text("Close View")
                }

            }
        }
    }
}

struct Add_EditJournalView_Previews: PreviewProvider {
    static var previews: some View {
        Add_EditJournalView(jvm: JournalViewModel())
    }
}
