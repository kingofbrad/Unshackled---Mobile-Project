//
//  journalListItem.swift
//  Unshackled
//
//  Created by Bradlee King on 20/10/2022.
//

import SwiftUI

struct journalListItem: View {
    @ObservedObject private var viewModel = JournalViewModel()
    
    var body: some View {
        List(viewModel.journalEntries) { entries in
            HStack {
                VStack(alignment: .leading) {
                    Text(entries.title)
                    Text(entries.text)
                }
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
        }
        .onAppear() {
            self.viewModel.fetchData()
    }
    }
}

struct journalListItem_Previews: PreviewProvider {
    static var previews: some View {
        journalListItem()
    }
}
