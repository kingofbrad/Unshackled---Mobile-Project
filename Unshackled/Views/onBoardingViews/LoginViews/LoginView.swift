//
//  LoginView.swift
//  Unshackled
//
//  Created by Bradlee King on 04/12/2022.
//

import SwiftUI

struct LoginView: View {
    @StateObject var ovm = onBoardingViewModel()
    @State private var toSignUpView: Bool = false
    @State private var isUserLoggedIn: Bool = false
    @State var isSecured: Bool = false
    
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
                
                Text(ovm.errorMessage)
            }
            .frame(maxHeight: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 73)
                    .foregroundColor(Color("lightpink"))
                    .frame(width: 600, height: 400)
                    .offset(x: -85, y: -410)
                    
            }
            .zIndex(0)
            
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
                TextField("", text: $ovm.email)
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
                            if !isSecured {
                                SecureField("", text: $ovm.password)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 340, height: 50)
                                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                                    .cornerRadius(10)
                                    .font(.custom("Poppins-Medium", size: 20))
                            } else {
                                TextField("", text: $ovm.password)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 340, height: 50)
                                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                                    .cornerRadius(10)
                                    .font(.custom("Poppins-Medium", size: 20))
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
        .zIndex(1)
        .padding(.bottom, 60)
    }
    var LoginButtonView: some View {
        VStack(spacing: 17) {
            NavigationLink(destination: HomeView(), isActive: $isUserLoggedIn) {
                CustomSignUpButton(text: "Login") {
                    ovm.loginAccount()
                    isUserLoggedIn = true
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
           
                Button {
                    ovm.loginBool = false
                } label: {
                    HStack{
                        Text("Not a Member?")
                            .foregroundColor(Color(.init(white: 0, alpha: 0.34)))
                            .font(.custom("Poppins-Medium", size: 17))
                        Text("Sign Up")
                            .foregroundColor(Color("lightTurquoise"))
                    }
                    .frame(width: 340, height: 50)
                    .cornerRadius(10)
                    .font(.custom("Poppins-Bold", size: 17))
                }
            
        }
        .padding(.bottom, 5)
    }
    
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(ovm: onBoardingViewModel())
    }
}

struct LoginViewNew_Previews: PreviewProvider {
    static var previews: some View {
        loginViewNew(toLogin: .constant(false))
    }
}

struct loginViewNew: View {
    @State var email: String = ""
    @State var password: String = ""
    @StateObject var ovm = onBoardingViewModel()
    @Binding var toLogin: Bool
    var body: some View {
        ZStack {
            Group {
                HStack {
                    Text("Hello again, let's sign you in")
                        .font(.custom("Vidaloka-Regular", size: 40))
                        .frame(width: 270)
                        .padding(.top, -30)
                    
                }
                .offset(x: -50, y: -300)
                .padding(.vertical, 45)
                RoundedRectangle(cornerRadius: 73)
                    .foregroundColor(Color("lightpink"))
                    .frame(width: 600, height: 400)
                    .offset(x: -85, y: -410)
                    .zIndex(-1)
            }
            VStack(spacing: 40) {
                inputFieldView(email: $email, password: $password, ovm: ovm)
                onboardingLowerTextView(toLogin: $toLogin)
                buttonView
            }
            .offset(y: 80)
            
        }
    }
    
    var buttonView: some View {
        VStack {
            CustomSignUpButton(text: "Login") {
                ovm.loginAccount()
            }
            CustomLoginButton(text: "Login with Google") {
                print("Login with google")
            }
            CustomLoginButton(text: "Login with Apple") {
                print("Login with apple")
            }
        }
    }
}



struct inputFieldView: View {
    @Binding var email: String
    @Binding var password: String
    @State private var isSecured: Bool = false
    @ObservedObject var ovm: onBoardingViewModel
    
    var body: some View {
        VStack {
            VStack(alignment:.leading) {
                Text("Email")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .fontWeight(.heavy)
                    .padding(.horizontal, -5)
                    .padding(.bottom, -4)
                TextField("", text: $ovm.email)
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
                            if isSecured {
                                SecureField("", text: $ovm.password)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 340, height: 50)
                                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                                    .cornerRadius(10)
                                    .font(.custom("Poppins-Medium", size: 20))
                            } else {
                                TextField("", text: $ovm.password)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 340, height: 50)
                                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                                    .cornerRadius(10)
                                    .font(.custom("Poppins-Medium", size: 20))
                            }
                        }
                        
                        
                        Button {
                            isSecured.toggle()
                        } label: {
                            Image(systemName: !isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                        .padding(.trailing, 10)
                    }
                }
                
            }
        }
    }
}

struct onboardingLowerTextView: View {
    @Binding var toLogin: Bool
    var body: some View {
        Button {
            toLogin = false
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




