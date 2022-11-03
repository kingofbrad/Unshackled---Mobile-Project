//
//  CalendarCell.swift
//  Unshackled
//
//  Created by Bradlee King on 31/10/2022.
//

import SwiftUI

struct CalendarCellView: View {
    @EnvironmentObject private var dateHolder: DateHolder
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    let dayInPrevMonth: Int
    
    
    var body: some View {
        Text(monthStruct().day())
            .foregroundColor(textColour(type: monthStruct().monthType))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func textColour(type: MonthType) -> Color{
        return type == MonthType.Current ? Color.black : Color.gray
    }
    
    func monthStruct() -> MonthStruct
    {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        
        if(count <= start)
        {
            let day = dayInPrevMonth + count - start
            return MonthStruct(monthType: MonthType.Previous, dayInt: day)
        }
        else if(count - start > daysInMonth)
        {
            let day = count - start - daysInMonth
            return MonthStruct(monthType: .Next, dayInt: day)
        }
        
        let day = count - start
        return MonthStruct(monthType: MonthType.Current, dayInt: day)
    }
    
}

struct CalendarCellView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCellView(count: 1, startingSpaces: 1, daysInMonth: 1, dayInPrevMonth: 1)
    }
}
