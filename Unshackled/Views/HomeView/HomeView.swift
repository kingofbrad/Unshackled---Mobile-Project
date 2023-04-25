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
            switch selectedTab {
            case .home:
                MainHomeView()
            case .planner:
                PlannerView()
            case .chats:
                MainMessagesView()
            case .sos:
                MoodView()
            case .profile:
                ProfileView(avm: AuthenticationViewModel())
            }
            CustomTabBar(selectedTab: $selectedTab)
        }
            .background(Color("lightpink"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
