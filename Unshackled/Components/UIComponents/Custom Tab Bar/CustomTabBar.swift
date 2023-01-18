//
//  CustomTabBar().swift
//  Unshackled
//
//  Created by Bradlee King on 17/01/2023.
//

import SwiftUI

enum Tabs: Int {
    case home = 0
    case planner = 1
    case chats = 2
    case sos = 3
}


struct CustomTabBar: View {
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack(alignment: .center , spacing: 50){
            Button {
                selectedTab = .home
            } label: {
                TabBarButton(buttonText: "Home", seletectedImage: "SelectedHome", image: "Home", isActive: selectedTab == .home)
            }
            Button {
                selectedTab = .planner
            } label: {
                TabBarButton(buttonText: "Planner", seletectedImage: "SelectedBook", image: "Book", isActive: selectedTab == .planner)
            }
            Button {
                selectedTab = .chats
            } label: {
                TabBarButton(buttonText: "Chat", seletectedImage: "SelectedChat", image: "Chat", isActive: selectedTab == .chats)
            }
            Button {
                selectedTab = .sos
            } label: {
                TabBarButton(buttonText: "SOS", seletectedImage: "SelectedSOS", image: "SOS", isActive: selectedTab == .sos)
            }
        
            
            
            
        }
        .frame(height:82)
        .padding(.horizontal, 30)
        .background(Color.white)
        .cornerRadius(10)
    }
    
}




struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.home))
    }
}


