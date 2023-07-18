//
//  AuthenticationViewModel.swift
//  Unshackled
//
//  Created by Bradlee King on 24/04/2023.
//

import Foundation
import Firebase
import GoogleSignIn


class AuthenticationViewModel: ObservableObject {
    
    enum signInState {
        case signedIn
        case signedOut
    }
    
    enum onBoardingComplete {
        case yes
        case no
    }
    
    @Published var state: signInState = .signedOut
    @Published var onBoardingState: onBoardingComplete = .yes
    
    
    
}
