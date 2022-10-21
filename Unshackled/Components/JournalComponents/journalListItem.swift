//
//  journalListItem.swift
//  Unshackled
//
//  Created by Bradlee King on 20/10/2022.
//

import SwiftUI

struct journalListItem: View {
    
    var entry: Entry
    
    @ObservedObject private var viewModel = JournalViewModel()
    
    var body: some View {
        
        Text(entry.title)
        
    }
    
}


struct journalListItem_Previews: PreviewProvider {
    static var previews: some View {
        let entry = Entry(title: "Monday", text: "This is a test", mood: "Sad")
        return
            NavigationView{
                journalListItem(entry: entry)
        }
    }
}
