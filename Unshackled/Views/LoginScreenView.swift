//
//  LoginScreenView.swift
//  Unshackled
//
//  Created by Bradlee King on 21/10/2022.
//

import SwiftUI
import Firebase

struct LoginScreenView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.2)
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [Color("Turquoise"), .white], startPoint:.topLeading, endPoint:.bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(-150))
                .offset(y: -380)
                .shadow(color: .gray, radius: 20)
            
            VStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Welcome")
                        .foregroundColor(.white)
                    .font(.system(size:40, weight: .bold, design: .rounded))
                    Text("“Just one small positive thought in the morning can change your whole day.”")
                        .foregroundColor(.white)
                        .font(.system(size:20, weight: .bold, design: .rounded))
                }
                    
                    
                TextField("", text: $username)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: username.isEmpty) {
                        Text("Username")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width:350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width:350, height: 1)
                    .foregroundColor(.white)
                
                HStack(spacing: 30) {
                    Button{} label: {
                        Text("Log In")
                            .bold()
                            .frame(width:150, height: 40)
                            .background{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [Color("Turquoise"), .white], startPoint: .topTrailing, endPoint: .bottomLeading))
                            }
                            .foregroundColor(.gray)
                    }
                    Button{} label: {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width:150, height: 40)
                            .background{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color.secondary)
                            }
                    }
                    
                }
                
            }
            .frame(width:350)
            
        }
        .ignoresSafeArea()
    }
    
    func login() {
        
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}

extension View {
    func placeholder<Content: View>(
        when showShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content)-> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(showShow ? 1 : 0)
                self
            }
        }
}
