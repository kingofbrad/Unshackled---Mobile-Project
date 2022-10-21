//
//  JournalDetailView.swift
//  Unshackled
//
//  Created by Bradlee King on 21/10/2022.
//

import SwiftUI

struct JournalDetailView: View {
    var entry: Entry
    
    @ObservedObject private var viewModel = JournalViewModel()
    
    var body: some View {
        Text(entry.title)
    }
    
}

struct JournalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = Entry(title: "Monday", text: "This is a test", mood: "Sad")
        return
            JournalDetailView(entry: entry)
    }
}
