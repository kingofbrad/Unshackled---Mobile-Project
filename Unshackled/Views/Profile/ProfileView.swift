//
//  ProfileView.swift
//  Unshackled
//
//  Created by Bradlee King on 22/10/2022.
//

import SwiftUI


struct ProfileView: View {

    
    var body: some View {
        VStack{
            Text("Bradlee King")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("lightpink"))
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
