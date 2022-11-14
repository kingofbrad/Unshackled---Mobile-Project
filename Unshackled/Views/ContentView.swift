//
//  ContentView.swift
//  Unshackled
//
//  Created by Bradlee King on 11/10/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @State private var dates: Set<DateComponents> = []
    @State private var UserLoggedOut = false
    @EnvironmentObject var dateHolder: DateHolder
    
    @State private var togglesheet = false
    
    var body: some View {
        VStack{
//            HStack{
//                Spacer()
//                Button{
//                    togglesheet.toggle()
//                }label: {
//                    Image(systemName: "gear")
//                        .imageScale(.large)
//                        .padding(.trailing, 20)
//                }
//                .sheet(isPresented: $togglesheet){
//                    ProfileView()
//                }
//            }
            
            TabView {
                MainJournalView(jvm: JournalViewModel())
                    .tabItem{
                        Label("Journals", systemImage: "book.fill")
                    }
                
                MainMessagesView()
                    .tabItem{
                        Label("Messages", systemImage: "message.fill")
                    }
                CalenderView()
                    .tabItem{
                        Label("Calender", systemImage: "calendar")
                    }
                    .environmentObject(dateHolder)
                MoodView()
                
                    .tabItem{
                        Label("Mood", systemImage: "person.fill")
                    }
            }
            .navigationBarBackButtonHidden(true)
            .accentColor(Color.blue)
            
        }
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
