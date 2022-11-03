//
//  CalenderView.swift
//  Unshackled
//
//  Created by Bradlee King on 31/10/2022.
//

import SwiftUI

struct CalenderView: View {
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        VStack(spacing: 1) {
            DateScrollerView()
                .environmentObject(dateHolder)
                .padding()
            dayOfWeekStack
            calendarGrid
        }
    }
    
    var dayOfWeekStack: some View {
        HStack{
            Text("Sun")
                .dayOfWeek()
            Text("Mon")
                .dayOfWeek()
            Text("Tues")
                .dayOfWeek()
            Text("Wed")
                .dayOfWeek()
            Text("Thu")
                .dayOfWeek()
            Text("Fri")
                .dayOfWeek()
            Text("Sat")
                .dayOfWeek()
            
        }
    }
    
    var calendarGrid: some View {
        
       
        VStack(spacing: 1)
        {
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(dateHolder.date)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
            ForEach(0..<6)
            {
                row in
                HStack(spacing: 1)
                {
                    ForEach(1..<8)
                    {
                        column in
                        let count = column + (row * 7)
                        CalendarCellView(count: count, startingSpaces: startingSpaces, daysInMonth: daysInMonth, dayInPrevMonth: daysInPrevMonth)
                            .environmentObject(dateHolder)
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}

extension Text{
    func dayOfWeek() -> some View
    {
        self.frame(maxWidth:.infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}
