//
//  NotesView.swift
//  Unshackled
//
//  Created by Bradlee King on 18/10/2022.
//

import SwiftUI

let dateFormatter = DateFormatter()

struct JournalItem: Codable, Hashable, Identifiable {
    let id: Int
    let text: String
    var date = Date()
    var dateText: String {
        dateFormatter.dateFormat = "MMM d yyyy, h:mm a"
        return dateFormatter.string(from: date)
    }
}

struct NotesView: View {
    @State var items: [JournalItem] = {
        guard let data = UserDefaults.standard.data(forKey: "notes") else {return [] }
        if let json = try? JSONDecoder().decode([JournalItem].self, from: data) {
            return json
        }
        return[]
    }()
    
    @State var taskText: String = ""
    
    @State var showAlert = false
    
    @State var itemToDelete: JournalItem?
    
    var alert: Alert {
        Alert(title: Text("Hey!!"),
              message: Text("Are you sure you want to delete this journal!!"),
              primaryButton: .destructive(Text("Delete"), action: deleteJournal),
              secondaryButton: .cancel())
    }
    
    var inputView: some View {
        HStack{
            TextField("Write a new journal entry ...", text: $taskText)
                .padding(EdgeInsets(top:0, leading: 16, bottom: 0, trailing: 16))
                .clipped()
            Button(action: didTapAddTask, label: {Text("Add")}).padding(8)
        }
        
    }
    
    var body: some View {
        VStack {
            inputView
            Divider()
            List(items) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.text).lineLimit(nil).multilineTextAlignment(.leading)
                        Text(item.dateText).font(.headline)
                        
                    }
                    .onLongPressGesture {
                        self.itemToDelete = item
                        self.showAlert = true
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                    
                }
                
            
            }
            .alert(isPresented: $showAlert, content: {
                alert
            
            })
            .scrollContentBackground(.hidden)
            .background(Color("Turquoise"))

            
            
        }
        
    }
    
    func didTapAddTask() {
        let id = items.reduce(0) {max($0, $1.id)} + 1
        items.insert(JournalItem(id: id, text: taskText), at: 0)
        taskText = ""
        save()
    }
    
                     func deleteJournal() {
            guard let itemToDelete = itemToDelete else { return}
            items = items.filter { $0 != itemToDelete}
            save()
        }
                     func save() {
            guard let data = try? JSONEncoder().encode(items) else {return}
            UserDefaults.standard.set(data, forKey: "notes")
        }
}



struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
