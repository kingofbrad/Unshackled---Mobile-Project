//
//  SignUpStage2View.swift
//  Unshackled
//
//  Created by Bradlee King on 19/11/2022.
//

import SwiftUI
import Combine

struct SignUpStage2View: View {
    @State private var SignUpVM = SignUpViewModal()
    @State private var email = ""
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    let countries = ["UK","USA","Japan","South Korea","Canada"]
    @State var selectedCountry = "UK"
    
    var body: some View {
        NavigationView {
            if !SignUpVM.finalViewToggle {
                Mainbody
            } else {
                SignUpFinalScreenView()
            }
        }
        .toolbar(.hidden)
        
    }
    
    var Mainbody: some View {
        VStack(spacing: 15){
            HStack {
                Text("Let's create an account for you")
                    .font(.custom("Vidaloka-Regular", size: 40))
                    .frame(width: 270)
                    .padding(.top, -30)
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 45)

            Spacer()
            
            if SignUpVM.createAccountProgress {
                createAccountStage2View
            } else {
                createAccountStage1View
            }
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
    
    var createAccountStage1View: some View {
        VStack {
            CheckListProgressView(isChecked: false, isChecked1: true, isChecked2: false, isChecked3: false )
            accountDetailsInputFieldsView
            locationView
            nextButtonViewStage1
            
        }
    }
    
    var createAccountStage2View: some View {
        VStack(spacing: 23){
            CheckListProgressView(isChecked: false, isChecked1: false, isChecked2: true, isChecked3: false)
            VStack{
                mobileNumberView
                VerificationNumberView
                termsAndConditionsView
                nextButtonViewStage2
                Spacer()
            }
            
            
        }
        .onAppear {
            withAnimation(.easeIn(duration: 4)) {
                    
            }
        }
    }
    
    var nextButtonViewStage1: some View {
        HStack {
            CustomButtonPrev(text: "Prev") {
                SignUpVM.createAccountProgress = false
            }
            CustomButtonNext(text: "Next") {
                if SignUpVM.CheckBoxToggle{
                    SignUpVM.createAccountProgress = true
                } else {
                    SignUpVM.showErrorMessage = true
                }
                
            }
            
            
            
            
        }
        .padding(.vertical, 20)
    }
    
    var nextButtonViewStage2: some View {
        HStack {
            CustomButtonPrev(text: "Prev") {
                SignUpVM.createAccountProgress = false
            }
            CustomButtonNext(text: "Next") {
                storeUserInformation()
                SignUpVM.finalViewToggle.toggle()
            }
            
            
        }
    }
    
    
//    Stage 1 Views
    var accountDetailsInputFieldsView: some View{
        VStack{
            VStack(alignment:.leading) {
                Text("Name")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .fontWeight(.heavy)
                    .padding(.horizontal, -5)
                    .padding(.bottom, -4)
                TextField("", text: $SignUpVM.name)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
            }
            
            HStack{
                Text("I give permission for the app or support survivors to all call me by my name. Your name will not be seen by other users.")
                    .font(.system(size: 15))
                CheckBox
                
            }
            .frame(width: 350, height:100)
            .padding(.horizontal, 20)
            .padding(.vertical, 0)
            if SignUpVM.showErrorMessage {
                Text("Please agree to continue")
                    .foregroundColor(.red)
                    .font(.custom("Poppins-Bold", size: 14))
            }
            
            dobView
            
            
        }
    }
    
    var dobView: some View {
        VStack(alignment: .leading) {
            Text("Date of Birth")
                .font(.custom("Poppins-SemiBold", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, -5)
                .padding(.bottom, -4)
            HStack(spacing: 15) {
                TextField("", text: $SignUpVM.dobDay)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 80, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                TextField("", text: $SignUpVM.dobMonth)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 150, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                TextField("", text: $SignUpVM.dobYear)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 80, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
            }
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
                TextField("", text: $SignUpVM.location)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 300, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                Button {
                    print("location")
                } label: {
                    Image(systemName: "location")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                }
                
            }
        }
    }
//    Stage 2 Views
    
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
                TextField("", text: $SignUpVM.mobileNumber)
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
                TextField("", text: $SignUpVM.verificationCode)
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
            CheckBox1
        }.frame(width: 350, height:100)
            .padding(.horizontal, 20)
            .padding(.vertical, 0)
    }
    
    
    
    
//    Components for ViewPage
    var CheckBox: some View {
        Button {
            SignUpVM.CheckBoxToggle.toggle()
        } label: {
            Image(systemName: "checkmark.square.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(Color(!SignUpVM.CheckBoxToggle ? "Gray" : "DarkTurquoise"))
        }
        
    }
    var CheckBox1: some View {
        Button {
            SignUpVM.CheckBoxToggle1.toggle()
        } label: {
            Image(systemName: "checkmark.square.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(Color(!SignUpVM.CheckBoxToggle1 ? "Gray" : "DarkTurquoise"))
        }
        
    }
    
    private func storeUserInformation() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        
        
        let userData = [

            "email": FirebaseManager.shared.auth.currentUser?.email,
            "uid": uid,
            "name": SignUpVM.name,
            "dobDay": SignUpVM.dobDay,
            "dobMonth": SignUpVM.dobMonth,
            "dobYear": SignUpVM.dobYear,
            "location": SignUpVM.location,
            "mobileNumber": SignUpVM.mobileNumber
        ]
        
        
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData as [String : Any]) { err in
                if let err = err {
                    print(err)
                    SignUpVM.errorMessage = "\(err)"
                    return
                }
                print("Success")
                
                
            }
    }
    
}

struct SignUpStage2View_Previews: PreviewProvider {
    static var previews: some View {
        SignUpStage2View()
    }
}


