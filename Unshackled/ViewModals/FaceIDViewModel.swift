import Foundation
import SwiftUI
import LocalAuthentication

class AppContext: ObservableObject {
    @Published var appUnlocked = false
    @Published var authorizationError: Error?
    
    func requestBiometricUnlock() {
        let context = LAContext()
        
        var error: NSError? = nil
        
        let canEvaluate = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        
        if canEvaluate {
            if context.biometryType != .none {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To access your data") { (success, error) in
                    DispatchQueue.main.async {
                        self.appUnlocked = success
                        self.authorizationError = error
                    }
                }
            }
        }
    }
}
