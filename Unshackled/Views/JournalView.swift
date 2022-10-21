//
//  JournalView.swift
//  Unshackled
//
//  Created by Bradlee King on 11/10/2022.
//

import SwiftUI

struct JournalView: View {
    @State private var showNewEntryScreen = false
    @ObservedObject private var viewModel = JournalViewModel()
    
    
    var body: some View {
        
        NavigationView {
            VStack{
                List(viewModel.journalEntries) {entries in
                    HStack() {
                        VStack(alignment:.leading){
                            Text(entries.title)
                            Text(entries.text)
                            
                        }
                        Text(entries.mood)
                        
                    }
                    
                }
                .scrollContentBackground(.hidden)
                
                
                
                
            }
            .navigationTitle("Journal Entires")
            .toolbar{
                Button("Add"){
                    showNewEntryScreen.toggle()
                }
                
            }
            .sheet(isPresented: $showNewEntryScreen) {
                JournalAddEntriyView()
            }
            
        }
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
    
    
    
}



struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
