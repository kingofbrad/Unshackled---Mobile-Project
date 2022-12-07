//
//  LoginView.swift
//  Unshackled
//
//  Created by Bradlee King on 04/12/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var VM = SignUpViewModal()
    @State private var toSignUpView: Bool = false
    
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10){
                HStack {
                    Text("Hello again, let’s sign you in")
                        .font(.custom("Vidaloka-Regular", size: 40))
                        .frame(width: 270)
                        .padding(.top, -70)
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 40)
                inputfieldsView
                LoginButtonView
                
                Text(VM.errorMessage)
            }
            .frame(maxHeight: .infinity)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .background {
                RoundedRectangle(cornerRadius: 73)
                    .foregroundColor(Color("lightpink"))
                    .frame(width: 600, height: 400)
                    .offset(x: -85, y: -410)
            }
            
        }
        .navigationBarBackButtonHidden()
    }
    var inputfieldsView: some View {
        VStack {
            VStack(alignment:.leading) {
                Text("Email")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .fontWeight(.heavy)
                    .padding(.horizontal, -5)
                    .padding(.bottom, -4)
                TextField("", text: $VM.email)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                    .font(.custom("Poppins-Medium", size: 20))
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
                            if VM.isSecured {
                                SecureField("", text: $VM.password)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 340, height: 50)
                                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                                    .cornerRadius(10)
                                    .font(.custom("Poppins-Medium", size: 20))
                            } else {
                                TextField("", text: $VM.password)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 340, height: 50)
                                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                                    .cornerRadius(10)
                                    .font(.custom("Poppins-Medium", size: 20))
                            }
                        }
                        
                        
                        Button(action: {
                            VM.isSecured.toggle()
                        }) {
                            Image(systemName: self.VM.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                        .padding(.trailing, 10)
                    }
                }
                
            }
        }
        .padding(.bottom, 60)
    }
    var LoginButtonView: some View {
        VStack(spacing: 17) {
            NavigationLink(destination: HomeView(), isActive: $VM.isUserLoggedIn) {
                CustomSignUpButton(text: "Login") {
                    loginAccount()
                }
            }
            
            
            
            Button {
                print("Login With Google")
            } label: {
                Label("Login with Google", image: "GoogleIcon")
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.6)))
                    .cornerRadius(10)
                    .font(.custom("Poppins-Bold", size: 17))
                    .foregroundColor(.black)
            }
            
            Button {
                print("Login with Apple")
            } label: {
                Label("Login with Apple", systemImage: "apple.logo")
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.6)))
                    .cornerRadius(10)
                    .font(.custom("Poppins-Bold", size: 17))
                    .foregroundColor(.black)
            }
            NavigationLink(destination: SignUpView(), isActive: $toSignUpView) {
                Button {
                   toSignUpView = true
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
        .padding(.bottom, 5)
    }
    
    
    private func loginAccount() {
        FirebaseManager.shared.auth.signIn(withEmail: VM.email, password: VM.password) { result, err in
            if let err = err {
                print("Couldn't Login User \(err)")
                return
            } else {
                print("Login Successful")
                VM.isUserLoggedIn = true
                VM.errorMessage = "User has logged in"
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
