//
//  MainEmotionLogView.swift
//  Unshackled
//
//  Created by Bradlee King on 15/02/2023.
//

import SwiftUI
import UIKit

struct Emojis: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var section: String
}




struct MainEmotionLogView: View {
    
    var date = Date()
    
    var emojiArray: [Emojis] = [
        .init(image: "happy", section: "Monday" ),
        .init(image: "sad", section: "Tuesday"),
        .init(image: "bored", section: "Wednesday"),
        .init(image: "smile-2", section: "Thursday"),
        .init(image: "smile-2", section: "Friday"),
        .init(image: "sad", section: "Saturday"),
        .init(image: "happy", section: "Sunday")
    ]
    
    
    var body: some View {
        NavigationStack {
            VStack{
                // Begining of Title
                HStack {
                    VStack(alignment: .leading) {
                        Text("Emotion Log")
                            .font(.custom("Vidaloka-Regular", size: 40))
                        Text("What have you been up to?")
                            .font(.custom("Poppins-SemiBold", size: 15))
                    }
                    Spacer()
                }
                .padding(.leading, 30)
                // End of Title
                HStack{
                    ForEach(emojiArray) { array in
                            Image(array.image)
                    }
                    
                }
                Text(Date.tomorrow, style: .date)
                
                Button {
                    
                } label: {
                    Text("Add new emoji")
                }

                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightpink"))
            
        }
    }
}

struct ActiviesScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
            }
        }
    }
}

struct MainEmotionLogView_Previews: PreviewProvider {
    static var previews: some View {
        MainEmotionLogView()
    }
}

struct EmojiBtnScrollView: View {
    var image: String
    var emojiBtnFunc: (() -> Void)
    
    var body: some View {
        Button(action: emojiBtnFunc) {
            Image(image)
                .resizable()
                .frame(width: 75, height: 75)
        }
    }
}

struct ActivitesBtnScrollView: View {
    var activitesBtnFunc: (() -> Void)
    var text: String
    var image: String
    
    var body: some View {
        Button(action: activitesBtnFunc) {
            VStack {
                Image(image)
                Text(text)
            }
        }
    }
}


extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
