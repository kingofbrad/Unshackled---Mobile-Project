//
//  SignUpView.swift
//  Unshackled
//
//  Created by Bradlee King on 15/11/2022.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSecured: Bool = true
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 73)
                .foregroundColor(Color("lightpink"))
                .frame(width: 600, height: 400)
                .offset(x: -85, y: -410)
            
            VStack{
                VStack(alignment: .leading){
                    HStack {
                        Text("Let's create an account for you")
                            .font(.custom("Vidaloka-Regular", size: 40))
                            .frame(width: 270)
                            .offset(x: -40, y: 50)
                    }
                    Spacer()
                }
                checkProgressView
                inputfieldsView
                signUpButtonView
               
            }
        }
    }
    
    var checkProgressView: some View {
        HStack(spacing: -0.4){
            Circle()
                .foregroundColor(Color("lightTurquoise"))
                .frame(width: 40)
            Rectangle()
                .foregroundColor(Color("lightpink"))
                .frame(width: 50, height: 10)
            Circle()
                .foregroundColor(Color("lightpink"))
                .frame(width: 40)
            Rectangle()
                .foregroundColor(Color("lightpink"))
                .frame(width: 50, height: 10)
            Circle()
                .foregroundColor(Color("lightpink"))
                .frame(width: 40)
        }
        .padding(.bottom, 30)
    }
    
    
    var inputfieldsView: some View {
        VStack {
            VStack(alignment:.leading) {
                Text("Email")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .fontWeight(.heavy)
                    .padding(.horizontal, -5)
                    .padding(.bottom, -4)
                TextField("", text: $email)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
            }
            VStack(alignment:.leading) {
                Text("Password")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .fontWeight(.heavy)
                    .padding(.horizontal, -5)
                    .padding(.bottom, -4)
                
                HStack {
                    ZStack(alignment: .trailing) {
                        Group {
                            if isSecured {
                                SecureField("", text: $password)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 340, height: 50)
                                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                                    .cornerRadius(10)
                            } else {
                                TextField("", text: $password)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 340, height: 50)
                                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                                    .cornerRadius(10)
                            }
                        }
                        
                        
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                        .padding(.trailing, 10)
                    }
                }
                
            }
        }
        .padding(.bottom, 60)
    }
    
    var signUpButtonView: some View {
        VStack(spacing: 20) {
            Button {
                print("Sign Up")
            } label: {
                Text("Sign Up")
                    .frame(width: 340, height: 50)
                    .background(Color("lightTurquoise"))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .font(.custom("Poppins-Bold", size: 17))
            }
            
            Button {
                print("Sign up with google")
            } label: {
                Label("SignUpwithGoogle", image: "GoogleIcon")
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                    .font(.custom("Poppins-Bold", size: 17))
                    .foregroundColor(.black)
            }
            
            Button {
                print("Sign up with Apple")
            } label: {
                Label("Sign Up with Apple", systemImage: "apple.logo")
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                    .font(.custom("Poppins-Bold", size: 17))
                    .foregroundColor(.black)
            }
            Button {
                print("To Sign In View")
            } label: {
                HStack{
                    Text("Already a member?")
                        .foregroundColor(Color(.init(white: 0, alpha: 0.34)))
                        .font(.custom("Poppins-Medium", size: 17))
                    Text("Login")
                        .foregroundColor(Color("lightTurquoise"))
                }
                .frame(width: 340, height: 50)
                .cornerRadius(10)
                .font(.custom("Poppins-Bold", size: 17))
                
                    
            }


        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
