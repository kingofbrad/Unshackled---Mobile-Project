//
//  Journal.swift
//  Unshackled
//
//  Created by Bradlee King on 19/10/2022.
//

import Foundation



struct Entry: Identifiable {

    
    var id: String = UUID().uuidString
    var title: String
    var text: String
    var mood: String
    var date = Date()
}
