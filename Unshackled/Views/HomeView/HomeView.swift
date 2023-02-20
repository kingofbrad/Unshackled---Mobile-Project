//
//  HomeView.swift
//  Unshackled
//
//  Created by Bradlee King on 04/12/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct HomeView: View {
    @State private var UserLoggedOut = false
    @State var selectedTab: Tabs = .home
    @State private var togglesheet = false
    var body: some View {
        VStack{
            if selectedTab == .home {
                MainHomeView()
            } else if selectedTab == .planner {
                PlannerView()
            } else if selectedTab == .chats {
                MainMessagesView()
            } else if selectedTab == .sos {
                MoodView()
            }
            CustomTabBar(selectedTab: $selectedTab)
        }
        .background(Color("lightpink"))
        .zIndex(10)
        
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
