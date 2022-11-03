//
//  ProfileView.swift
//  Unshackled
//
//  Created by Bradlee King on 22/10/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ProfileView: View {
    let user = Auth.auth().currentUser
    @ObservedObject private var vm = MainMessagesViewModel()

    
    var body: some View {
        VStack{
            Text((user?.email)!)
            
            Button {
                vm.handleSignOut()
            } label: {
                Text("Sign Out")
                    .font(.system(size: 30, weight: .bold))
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
