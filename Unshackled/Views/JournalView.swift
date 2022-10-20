//
//  JournalView.swift
//  Unshackled
//
//  Created by Bradlee King on 11/10/2022.
//

import SwiftUI

struct JournalView: View {
    @State private var showingSheet = false
    @ObservedObject private var viewModel = JournalViewModel()
    
    
    var body: some View {
        
        NavigationView {
            VStack{
                //New Entry BTN
                Button{
                    showingSheet.toggle()
                } label: {
                    Text("New Entry")
                        .frame(width: 100, height: 50)
                        .background(Color.secondary)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showingSheet) {
                    JournalAddEntriyView()
                }
                
                List(viewModel.journalEntries) {entries in
                    VStack {
                        Text(entries.title)
                        Text(entries.text)
                        Text(entries.mood)
                    }
                    
                }
                .scrollContentBackground(.hidden)
                
                
                
              
            }
            
        }
        .navigationTitle("Journal Entires")
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
