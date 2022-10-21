//
//  Journal.swift
//  Unshackled
//
//  Created by Bradlee King on 19/10/2022.
//

import Foundation
import FirebaseFirestoreSwift



struct Entry: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var text: String
    var mood: String
    var date = Date()
    
    enum CodingKeys: String, CodingKey {
        case title
        case text
        case mood
    }
}
