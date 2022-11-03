//
//  UnshackledApp.swift
//  Unshackled
//
//  Created by Bradlee King on 11/10/2022.
//

import SwiftUI



@main
struct UnshackledApp: App {
    let dateHolder = DateHolder()
    @State private var userloggedin = true
    
    var body: some Scene {
        WindowGroup {
            if (userloggedin) {
                ContentView()
                    .environmentObject(dateHolder)
            } else {
                LoginScreenView(didCompleteLoginProgress: {})
            }
        
        }
    }
}
