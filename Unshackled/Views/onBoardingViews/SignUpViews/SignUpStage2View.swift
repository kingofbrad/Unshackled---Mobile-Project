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
                
            } else {
                SignUpFinalScreenView()
            }
        }
        .toolbar(.hidden)
        
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


