import Foundation
import SwiftUI
import LocalAuthentication

class AppContext: ObservableObject {
    @Published var appUnlocked = false
    @Published var authorizationError: Error?
    @Published var showingSheet = false
    
    func requestBiometricUnlock() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authorizationError in
                if success {
                    self.appUnlocked = true
                } else{
                    print(error?.localizedDescription)
                }
            }
        } else {
            // No Biometrics
        }
        
    }
}
