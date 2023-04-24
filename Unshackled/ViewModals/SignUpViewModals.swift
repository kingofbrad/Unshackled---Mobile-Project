//
//  SignUpViewModals.swift
//  Unshackled
//
//  Created by Bradlee King on 03/12/2022.
//

import Foundation

class SignUpViewModal: ObservableObject {
    
    
    
    
     var toLogin: Bool = false
    
//    SignUpAndLoginViewToggle Boolan
    var UserSignInToggle: Bool = false
    
    
//    sign up page 1
    var email: String = ""
    var password: String = ""
    var nextStepview: Bool = false
    var name: String = ""
    
//   Date of Birth Section
    
    var dobDay: String = ""
    var dobMonth: String = ""
    var dobYear: String = ""
    var location: String = ""
    
   
    
    
    
    
   
    
    

//    sign up page 3
    
    var mobileNumber: String = ""
    var verificationCode: String = ""
    
//    Login
   
    
    
    
//    logic for sign up progress
    var finalViewToggle: Bool = false
    var CheckBoxToggle: Bool = false
    var CheckBoxToggle1: Bool = false
    var createAccountProgress: Bool = false
    var showErrorMessage: Bool = false
    
    var errorMessage: String = ""
    
    var onBoarding:Int = 1
    
    
    
    
    
    
}



