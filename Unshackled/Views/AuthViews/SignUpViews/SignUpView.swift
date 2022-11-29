import SwiftUI




struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSecured: Bool = true
    @State var nextStepview = false
    
    @StateObject private var keyboardHanlder = KeyboardHandler()
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15){
                HStack {
                    Text("Let's create an account for you")
                        .font(.custom("Vidaloka-Regular", size: 40))
                        .frame(width: 270)
                        .padding(.top, -30)
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 40)
                CheckListProgressView(isChecked: true, isChecked1: false, isChecked2: false, isChecked3: false)
                inputfieldsView
                signUpButtonView
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
                                SecureField("", text: $password)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 340, height: 50)
                                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                                    .cornerRadius(10)
                                    .font(.custom("Poppins-Medium", size: 20))
                            } else {
                                TextField("", text: $password)
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
        .padding(.bottom, 60)
    }
    
    var signUpButtonView: some View {
        VStack(spacing: 17) {
            NavigationLink(destination: SignUpStage2View(), isActive: $nextStepview) {
                CustomSignUpButton(text: "Sign Up") {
                    print("Created a new account")
                }
            }
            
            Button {
                nextStepview = true
            } label: {
                Label("SignUp with Google", image: "GoogleIcon")
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.6)))
                    .cornerRadius(10)
                    .font(.custom("Poppins-Bold", size: 17))
                    .foregroundColor(.black)
            }
            
            Button {
                print("Sign up with Apple")
            } label: {
                Label("Sign Up with Apple", systemImage: "apple.logo")
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.6)))
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
        .padding(.bottom, 5)
    }
    
    //    Function Section
    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Couldn't Create User \(err)")
                return
            }
            print("Successfully created user")
            nextStepview = true
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView( nextStepview: false)
    }
    
}





