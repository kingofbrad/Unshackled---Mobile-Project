//
//  MonthStruct.swift
//  Unshackled
//
//  Created by Bradlee King on 31/10/2022.
//

import Foundation

struct MonthStruct
{
    var monthType: MonthType
    var dayInt: Int
    func day() -> String {
        return String(dayInt)
    }
}

enum MonthType
{
    case Previous
    case Current
    case Next
}
