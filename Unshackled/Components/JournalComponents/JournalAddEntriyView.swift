//
//  JournalAddEntriyView.swift
//  Unshackled
//
//  Created by Bradlee King on 18/10/2022.
//

import SwiftUI



let dateFormatter = DateFormatter()

struct JournalItem: Codable, Hashable, Identifiable {
    let id: Int
    let text: String
    let title: String
    var date = Date()
    var dateText: String {
        dateFormatter.dateFormat = "MMM d yyyy, h:mm a"
        return dateFormatter.string(from: date)
    }
}

struct JournalAddEntriyView: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    @State var journalTitle: String = ""
    @State var journalText: String = ""
    @State var itemToDelete: JournalItem?
    @State var showAlert = false
    
    var body: some View {
            VStack{
                Text("How are you feeling today??")
                    .bold()
                    .font(.title3)
                titleEntry
                textEntry
                HStack{
                    savebtn
                    cancelbtn
                }
            }
            .padding()
        
    }
        
    var titleEntry: some View {
        VStack(alignment: .leading){
            Text("Enter a title")
                .foregroundColor(Color.gray)
                .bold()
                .font(.title3)
                .padding(6)
            TextField("Place your title here...", text: $journalTitle)
                .background(Color.white)
                .foregroundColor(Color(.red))
                .font(.title2)
                .padding(6)
                
                
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2), lineWidth: 4))
        .padding(.bottom, 20)
        
        
        
        
        
    }
    var textEntry: some View {
        VStack(alignment: .leading) {
            Text("Journal Entry")
                .bold()
                .font(.title2)
            TextEditor(text: $journalText)
                .frame(height:250)
                .background(Color("Turquoise"))
                .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2), lineWidth: 4))
        }
            
    }
    var savebtn: some View {
        Button{
            AddEntry()
            dismiss()
        } label: {
            Text("Add Entry ")
        }
    }
    var cancelbtn: some View {
        Button{
            showAlert = true
        } label: {
            Text("Cancel")
        }
        .alert("Are you sure", isPresented: $showAlert) {
            Button("Yes") {
                dismiss()
            }
            Button("Return") {
               
            }
                
            
        }
    }
            
        
       func AddEntry() {
           dismiss()
        }
        
        
    }
    


struct JournalAddEntriyView_Previews: PreviewProvider {
    static var previews: some View {
        JournalAddEntriyView()
    }
}


struct Moodpicker: View {
    @State private var selectedMood = ""
    
    
    var body: some View{
        Picker("Strength", selection: $selectedMood) {
            ForEach(Moods, id: \.self) {
                Text($0)
            }
        }
    }
}



