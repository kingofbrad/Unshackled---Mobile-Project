//
//  SignUpViewModals.swift
//  Unshackled
//
//  Created by Bradlee King on 03/12/2022.
//

import Foundation

struct SignUpViewModal {
//    SignUpAndLoginViewToggle Boolan
    var UserSignInToggle: Bool = false
    
    
//    sign up page 1
    var email = ""
    var password = ""
    
//    sign up page 2
    var name = ""
    var dobDay = ""
    var dobMonth = ""
    var dobYear = ""
    var location = ""

//    sign up page 3
    
    var mobileNumber = ""
    var verificationCode = ""
    
//    Login
    var isSecured: Bool = false
    var isUserLoggedIn: Bool = false
    
    
//    logic for sign up progress
    var finalViewToggle = false
    var CheckBoxToggle = false
    var CheckBoxToggle1 = false
    var createAccountProgress = false
    var showErrorMessage = false
    
    var errorMessage = ""
    
}

