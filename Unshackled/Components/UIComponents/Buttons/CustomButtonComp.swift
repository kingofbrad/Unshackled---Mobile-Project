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
            HStack {
                Text(text) /// your text
                
            }
            .frame(width: 340, height: 50)
            .background(Color("lightTurquoise"))
            .cornerRadius(10)
            .foregroundColor(.black)
            .font(.custom("Poppins-Bold", size: 17))
        }
    }
}

struct CustomButtonComp_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonComp()
    }
}
