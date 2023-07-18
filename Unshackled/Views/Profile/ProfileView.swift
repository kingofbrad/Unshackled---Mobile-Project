//
//  ProfileView.swift
//  Unshackled
//
//  Created by Bradlee King on 22/10/2022.
//

import SwiftUI


struct ProfileView: View {
    @StateObject var avm: AuthenticationViewModel
    
    var body: some View {
        VStack{
            Text("Bradlee King")
            
            if avm.onBoardingState == .yes {
                Text("onBoarding is complete")
                    .frame(width: 200, height: 60)
                    .background(Color.blue)
                    .cornerRadius(10)
            } else {
                Text("onBoarding is not Complete")
                    .frame(width: 200, height: 60)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("lightpink"))
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(avm: AuthenticationViewModel())
    }
}
