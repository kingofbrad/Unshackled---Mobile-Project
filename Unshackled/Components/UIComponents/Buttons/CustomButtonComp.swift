//
//  CustomButtonComp.swift
//  Unshackled
//
//  Created by Bradlee King on 27/11/2022.
//

import SwiftUI

struct CustomButtonComp: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    CustomButtonPrev(text: "Back") {
                        print("hello there")
                    }
                    CustomButtonNext(text: "Next") {
                        print("Hello theree")
                    }
                }
                CustomSignUpButton(text:"Sign Up") {
                    print("Custom Sign Up Button")
                }
                CustomButtonPhoneNumber(image: "UKFlag") {
                    print("Phone Number Button Pressed")
                }
                
                CustomLoginButton(text: "Login with Apple"){
                    print("Login with apple pressed")
                }
            }
        }
    }
}

struct CustomButtonPrev: View {
    var text: String
   
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) { /// call the closure here
            HStack {
                Text(text) /// your text
                
            }
            .foregroundColor(Color.black)
            .frame(width: 130)
            .padding()
            .background(Color(.init(white: 0, alpha: 0.07)))
            .cornerRadius(15)
            .font(.custom("Poppins-Bold", size: 18))
            
        }
    }
}
struct CustomButtonNext: View {
    var text: String
   
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) { /// call the closure here
            HStack {
                Text(text) /// your text
                
            }
            .foregroundColor(Color.black)
            .frame(width: 130)
            .padding()
            .background(Color("DarkTurquoise"))
            .cornerRadius(15)
            .font(.custom("Poppins-Bold", size: 18))
        }
    }
}

struct CustomButtonPhoneNumber: View {
    var image: String
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 38, height: 30)
            }
            .frame(width: 50, height: 50)
            .padding(.horizontal, 10)
            .background(Color(.init(white: 0.9, alpha: 0.3)))
            .cornerRadius(15)
        }
    }
}
struct CustomSignUpButton: View {
    var text: String
   
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) { /// call the closure here
                Text(text) /// your text
        }
        .buttonStyle(SignUpButtonStyle())
    }
}

struct CustomLoginButton: View {
    var text: String
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
        }
        .buttonStyle(LoginButtonStyle())

    }
}

struct LoginButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 340, height: 50)
            .background(Color(.init(white: 0.9, alpha: 0.6)))
            .cornerRadius(10)
            .font(.custom("Poppins-Bold", size: 17))
            .foregroundColor(.black)
    }
}

struct SignUpButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 340, height: 50)
            .background(Color("lightTurquoise"))
            .cornerRadius(10)
            .font(.custom("Poppins-Bold", size: 17))
            .foregroundColor(.black)
    }
}


struct onboardingLowerTextView: View {
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Text("Not a member?")
                    .foregroundColor(Color(.init(white: 0, alpha: 0.34)))
                    .font(.custom("Poppins-Medium", size: 17))
                Text("Sign up")
                    .foregroundColor(Color("DarkTurquoise"))
                    .font(.custom("Poppins-Bold", size: 17))
                    
            }
            
        }
    }
}

struct CustomButtonComp_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonComp()
    }
}
