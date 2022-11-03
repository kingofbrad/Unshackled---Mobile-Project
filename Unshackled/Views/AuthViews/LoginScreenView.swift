//
//  LoginScreenView.swift
//  Unshackled
//
//  Created by Bradlee King on 21/10/2022.
//

import SwiftUI
import Firebase


struct LoginScreenView: View {
    
    let didCompleteLoginProgress: () -> ()
    
    @State private var isLoginMode = false
    @State private var email = ""
    @State private var password = ""
    @State private var firstname = ""
    @State private var lastname = ""
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack{
                    Picker(selection:$isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    if !isLoginMode {
                        Button{
                            print("Button Tapped")
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                        TextField("First Name", text: $firstname)
                            .padding(12)
                            .background(Color.white)
                        TextField("Last Name", text: $lastname)
                            .padding(12)
                            .background(Color.white)
                    }
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .padding(12)
                        .background(Color.white)
                    SecureField("Password", text: $password)
                        .padding(12)
                        .background(Color.white)
                    Button{
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ?"Login" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                            Spacer()
                            
                        }
                        .background(Color.blue)
                    }
                    Text(self.errorMessage)
                        .foregroundColor(.red)
                }
                .padding()
                
                
                
            }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
                .ignoresSafeArea())
        }
        
    }
    
    private func handleAction() {
        if isLoginMode {
            loginUser()
        } else {
            createNewAccount()
        }
    }
    
    @State var errorMessage = ""
    
    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                self.errorMessage = "Failed to create user: \(err)"
                return
            }
            self.errorMessage = "Successfully created User: \(result?.user.uid ?? "")"
            storeUserInformation()
        }
        
    }
    
    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {result, err in
            if let err = err {
                self.errorMessage = "Failed to login user: \(err)"
                return
            }
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            self.errorMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            
            self.didCompleteLoginProgress()
        }
    }
    
    private func storeUserInformation() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        let userData = ["email": self.email, "uid": uid, "firstname": self.firstname, "lastname": self.lastname]
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { err in
                if let err = err {
                    print(err)
                    self.errorMessage = "\(err)"
                    return
                }
                print("Success")
                
                self.didCompleteLoginProgress()
            }
    }
}
struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView(didCompleteLoginProgress: {})
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

