//
//  FirebaseManager.swift
//  Unshackled
//
//  Created by Bradlee King on 31/10/2022.
//

import Foundation
import Firebase


class FirebaseManager: NSObject {
    let auth: Auth
    let firestore: Firestore
    
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
    
    
}
