//
//  ChatUSerModel.swift
//  Unshackled
//
//  Created by Bradlee King on 01/11/2022.
//

import Foundation


struct ChatUser: Identifiable {
    var id: String {uid}
    
    let uid: String
    let email: String
    let firstname: String
    let lastname: String
    let name: String
    
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.firstname = data["firstname"] as? String ?? ""
        self.lastname = data["lastname"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
    }
}
