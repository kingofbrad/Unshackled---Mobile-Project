//
//  ContentView.swift
//  Unshackled
//
//  Created by Bradlee King on 11/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var dates: Set<DateComponents> = []
    
    var body: some View {
        TabView {
            MultiDatePicker("Dates Available", selection: $dates).fixedSize()
                .tabItem{
                    Label("Calender", systemImage: "calendar")
                }
            MoodView()
                .tabItem {
                    Label("Mood", systemImage: "face.smiling.fill")
                }
            JournalView()
                .tabItem {
                    Label("Journal", systemImage: "book.fill")
                }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}