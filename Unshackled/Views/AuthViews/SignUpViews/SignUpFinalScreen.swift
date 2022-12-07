//
//  SignUpFinalScreen.swift
//  Unshackled
//
//  Created by Bradlee King on 29/11/2022.
//

import SwiftUI

struct SignUpFinalScreenView: View {
    
    func nextBtnPressed() {
        print("Let's Go Button Pressed")
        
    }
    func prevBtnPressed() {
       print("Skip Button Pressed")
        SignUpVM.isUserLoggedIn = true
    }
    @State private var SignUpVM = SignUpViewModal()
    
    var body: some View {
            VStack(alignment: .leading){
                Text("You’ve successfully created your account")
                    .font(.custom("Vidaloka-Regular", size: 40))
                    .frame(width: 300)
                VStack {
                    
                    
                    CheckListProgressView(isChecked: false, isChecked1: false, isChecked2: false, isChecked3: true)
                    Image("PersonOnSofa")
                    Text("We have some awesome features we would love to show you, OK?")
                        .font(.custom("Poppins-Medium", size: 17))
                        .frame(width: 320)
                        .padding(.bottom, 30)
                        
                    
                    HStack {
                        NavigationLink(destination: HomeView(), isActive: $SignUpVM.isUserLoggedIn) {
                            CustomButtonPrev(text: "Skip", clicked: prevBtnPressed)
                        }
                        
                        CustomButtonNext(text: "Let's go", clicked: nextBtnPressed )
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightpink"))
        .ignoresSafeArea(.all)
        
        }
    
}

struct SignUpFinalScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFinalScreenView()
    }
}
