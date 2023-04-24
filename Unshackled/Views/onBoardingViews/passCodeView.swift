//
//  passCodeView.swift
//  Unshackled
//
//  Created by Bradlee King on 06/04/2023.
//

import SwiftUI



struct passCodeView: View {
    @State var pin = ""
    @State var loginSheet: Bool = false
    @State var wrongPassCodeAlert: Bool = false
    let alertTitle: String = "Wrong passcode entered"
    
    var body: some View {
        VStack {
            Text("Hello There")
                .font(.system(size: 30, weight: .semibold))
            Text("Please enter your passcode")
            passCodeBox(pin: $pin)
            
            Button {
                if( pin == "1234") {
                    loginSheet = true
                } else {
                    wrongPassCodeAlert = true
                }
            } label: {
                Text("Log in")
            }
            .alert(isPresented: $wrongPassCodeAlert) {
                Alert(
                title: Text(alertTitle),
                message: Text("Please enter the correct passcode to login!!")
                )

            }
            .fullScreenCover(isPresented: $loginSheet) {
                HomeView()
            }
            
            
            
            
            
        }
    }
    
}

struct passCodeView_Previews: PreviewProvider {
    static var previews: some View {
        passCodeView()
    }
}

struct passCodeBox: View {
    @State var showPin: Bool = false
    @Binding var pin: String
    
    
    
    var body: some View {
        HStack {
            if showPin {
                TextField("",text: $pin)
                   
                    
            } else {
                SecureField("", text: $pin)
                  
            }
            
            Button {
                showPin.toggle()
            } label: {
                
                Image(systemName: showPin ? "eye.slash" : "eye")
                    .foregroundColor(.black)
            }
        }
        .frame(width: 300, height: 50)
        .padding(.horizontal, 10)
        .background(Color("Turquoise"))
        .cornerRadius(10)
        .multilineTextAlignment(.center)
        .fontWeight(.semibold)
        .font(.custom("Poppins-Regluar", size: 20))
        .autocorrectionDisabled()
    }
}


struct pinDigit: View {
    
    @State private var input: String = ""
    
    var body: some View {
        VStack {
            SecureField("", text: $input)
                .frame(width: 50, height: 50)
                .background(Color.green)
            
        }
    }
}

