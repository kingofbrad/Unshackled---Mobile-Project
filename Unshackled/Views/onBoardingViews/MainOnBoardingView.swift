import SwiftUI
import CoreLocationUI
import CoreLocation

class onBoardingViewModel: ObservableObject {
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    @Published var mobileNumber = ""
    @Published var verificationCode = ""
    var errorMessage = ""
    var location: String = ""
    var loginBool: Bool = false
    var isSecured: Bool = true
    
    @Published var birthDate = Date()
   
    
    func loginAccount() {
        FirebaseManager.shared.auth.signIn(withEmail: self.email , password: self.password ) { result, err in
            if let err = err {
                print("Couldn't Login User \(err)")
                return
            } else {
                print("Login Successful")
                self.errorMessage = "User has logged in"
            }
            
        }
    }
    func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: self.email, password: self.password) { result, err in
            if let err = err {
                print("Couldn't Create User \(err)")
                return
            }
            print("Successfully created user")
        }
    }
    
    func storeUserInformation() {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        
        
        let userData = [
            
            "email": FirebaseManager.shared.auth.currentUser?.email as Any,
            "uid": uid,
            "location": self.location,
            "mobileNumber": self.mobileNumber,
        ] as [String : Any]
        
        
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).updateData(userData as [String : Any]) { err in
                if let err = err {
                    print(err)
                    self.errorMessage = "\(err)"
                    return
                }
                print("Success")
                
                
            }
    }
}


struct MainOnBoardingView: View {
    @ObservedObject var vm = SignUpViewModal()
    @StateObject var ovm: onBoardingViewModel
    @State var email: String = ""
    
   
    
    @State var selectedTab: ProgressTabs = .checked
    
    var body: some View {
            ZStack {
                
                if(selectedTab == .checked3) {
                    
                } else {
                    Group {
                        HStack {
                            Text("Let's create an account for you")
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
                }
                
                
                ProgressBar(selectedTab: $selectedTab)
                
                switch selectedTab {
                case .checked:
                    Page0(selectedTab: $selectedTab)
                case .checked1:
                    Page1(vm: vm , selectedTab: $selectedTab)
                case .checked2:
                    Page2(selectedTab: $selectedTab, vm: vm)
                case .checked3:
                    Page3(selectedTab: $selectedTab, vm:vm, ovm: ovm, avm: AuthenticationViewModel())
                }
            }
    }
    
}

struct ProgressBar: View {
    @Binding var selectedTab: ProgressTabs
    var body: some View {
        ZStack {
            switch selectedTab {
            case .checked:
                Checked()
            case .checked1:
                Checked1()
            case .checked2:
                Checked2()
            case .checked3:
                Checked3()
            }
        }
        .offset(y:-160)
    }
}

struct MainOnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        MainOnBoardingView(vm: SignUpViewModal(), ovm: onBoardingViewModel())
    }
}
struct Page0: View {
    @Binding var selectedTab: ProgressTabs
    
    
    @StateObject var ovm = onBoardingViewModel()
    @State var toLogin: Bool = false
    
    @State private var isSecured: Bool = true
    
    
    var body: some View {
        MainSignUp
    }
    var MainSignUp: some View {
        VStack(spacing: 15){
            inputfieldsView
            signUpButtonView
        }
        .padding(.top, 220)
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
        .padding(.bottom, 60)
    }
    var signUpButtonView: some View {
        VStack(spacing: 17) {
            CustomSignUpButton(text: "Sign Up") {
                ovm.createNewAccount()
                selectedTab = .checked1
            }
            
            Button {
                print("Sign up with Google")
            } label: {
                Label("Sign Up with Google", image: "GoogleIcon")
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
                toLogin = true
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
            .fullScreenCover(isPresented: $toLogin) {
                loginViewNew(toLogin: $toLogin )
            }
            
            
        }
        
    }
}



struct Page1: View {
    @ObservedObject var vm: SignUpViewModal
    @Binding var selectedTab: ProgressTabs
    @StateObject var locationManager = LocationManager()

    
    @StateObject var dvm = dobViewModel()
    
    var body: some View {
        VStack {
            createAccountStage1View
            
        }
        .padding(.top, 220)
    }
    
    var createAccountStage1View: some View {
        VStack {
            accountDetailsInputFieldsView
            locationView
            nextButtonViewStage1
            
        }
    }
    var accountDetailsInputFieldsView: some View{
        VStack{
            VStack(alignment:.leading) {
                Text("Name")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .fontWeight(.heavy)
                    .padding(.horizontal, -5)
                    .padding(.bottom, -4)
                TextField("", text: $dvm.name)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
            }
            
            HStack{
                Text("I give permission for the app or support survivors to all call me by my name. Your name will not be seen by other users.")
                    .font(.system(size: 15))
                CheckBox(vm: SignUpViewModal()) {
                    vm.CheckBoxToggle.toggle()
                }
                
            }
            .frame(width: 350, height:100)
            .padding(.horizontal, 20)
            .padding(.vertical, 0)
            if vm.showErrorMessage {
                Text("Please agree to continue")
                    .foregroundColor(.red)
                    .font(.custom("Poppins-Bold", size: 14))
            }
            
            DOBPicker(dvm: dvm)
            
            
        }
    }
    
    var locationView: some View {
        VStack(alignment: .leading) {
            Text("Location")
                .font(.custom("Poppins-SemiBold", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, -5)
                .padding(.bottom, -4)
            HStack {
                    TextField("", text: $vm.location)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .frame(width: 300, height: 50)
                        .background(Color(.init(white: 0.9, alpha: 0.3)))
                        .cornerRadius(10)
                
                LocationButton {
                    locationManager.requestLocation()
                }
//                    Image(systemName: "location")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.black)
                
                
            }
        }
    }
    var nextButtonViewStage1: some View {
        HStack {
            CustomButtonPrev(text: "Prev") {
                selectedTab = .checked
            }
            CustomButtonNext(text: "Next") {
                dvm.UpdateUserInformation()
                selectedTab = .checked2
                
            }
            
            
            
            
        }
        .padding(.vertical, 20)
    }
}

struct Page2: View {
    @Binding var selectedTab: ProgressTabs
    @ObservedObject var vm = SignUpViewModal()
    @StateObject var ovm = onBoardingViewModel()
    
    var body: some View {
        VStack {
            createAccountStage2View
        }
        .padding(.top, 170)
    }
    
    var createAccountStage2View: some View {
        VStack(spacing: 23){
            
            VStack{
                mobileNumberView
                VerificationNumberView
                termsAndConditionsView
                nextButtonViewStage2
            }
            
            
        }
        .onAppear {
            withAnimation(.easeIn(duration: 4)) {
                
            }
        }
    }
    
    
    var mobileNumberView: some View {
        VStack(alignment: .leading) {
            Text("Mobile Number")
                .font(.custom("Poppins-SemiBold", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, -5)
                .padding(.bottom, -4)
            HStack {
                CustomButtonPhoneNumber(image: "UKFlag") {
                    print("Phone Number Clicked")
                }
                TextField("", text: $ovm.mobileNumber)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 260, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
            }
        }
    }
    
    var VerificationNumberView: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Verification Code")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .fontWeight(.heavy)
                    .padding(.horizontal, -5)
                    .padding(.bottom, -4)
                TextField("", text: $vm.verificationCode)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
            }
            HStack {
                Text("Not recieved a code?")
                Button {
                    print("resend code button pressed?")
                } label: {
                    Text("Resend")
                        .foregroundColor(Color("DarkTurquoise"))
                }
                
            }
            .padding(.vertical, 15)
            .font(.custom("Poppins-Medium", size: 13))
            
        }
    }
    
    var termsAndConditionsView: some View {
        HStack(spacing: 25) {
            Text("I give permission for the app or support survivors to call me. Your number will not be seen by other users.")
                .font(.custom("Poppins-Medium", size: 14))
            CheckBox(vm: SignUpViewModal()) {
                vm.CheckBoxToggle1.toggle()
            }
        }.frame(width: 350, height:100)
            .padding(.horizontal, 20)
            .padding(.vertical, 0)
    }
    var nextButtonViewStage2: some View {
        HStack {
            CustomButtonPrev(text: "Prev") {
                selectedTab = .checked1
            }
            CustomButtonNext(text: "Next") {
                
                ovm.storeUserInformation()
                selectedTab = .checked3
            }
            
            
        }
    }
    
    
    
}

struct Page3: View {
    @Binding var selectedTab: ProgressTabs
    @ObservedObject var vm: SignUpViewModal
    @StateObject var ovm: onBoardingViewModel
    
    @AppStorage("onBoardingValue") private var onBoardingComplete: Bool = false
    
    @StateObject var avm: AuthenticationViewModel
    func nextBtnPressed() {
        if onBoardingComplete == true {
            avm.onBoardingState = .yes
        }
    }
    func prevBtnPressed() {
       print("Skip Button Pressed")
        ovm.loginBool = true
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("You’ve successfully created your account")
                    .font(.custom("Vidaloka-Regular", size: 40))
                    .frame(width: 300)
                    .offset(y: -100)
                VStack {
                    
                    
                    Image("PersonOnSofa")
                    Text("We have some awesome features we would love to show you, OK?")
                        .font(.custom("Poppins-Medium", size: 17))
                        .frame(width: 320)
                        .padding(.bottom, 30)
                        
                    
                    HStack {
                        NavigationLink(destination: HomeView(), isActive: $ovm.loginBool) {
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
}


struct CheckBox: View {
    @ObservedObject var vm: SignUpViewModal
    
    var clicked: (() -> Void)
    var body: some View {
        Button(action: clicked){
            Image(systemName: "checkmark.square.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(Color(!vm.CheckBoxToggle ? "Gray" : "DarkTurquoise"))
        }
        
    }
}


