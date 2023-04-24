//
//  UnshackledApp.swift
//  Unshackled
//
//  Created by Bradlee King on 11/10/2022.
//

import SwiftUI



@main
struct UnshackledApp: App {
    @State private var userloggedin = true
    
    var body: some Scene {
        WindowGroup {
//            HomeView()
            
            SplashScreenView()
        }
        
       
    }
}
