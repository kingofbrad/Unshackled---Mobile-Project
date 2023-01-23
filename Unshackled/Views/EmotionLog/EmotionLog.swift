//
//  EmotionLog.swift
//  Unshackled
//
//  Created by Bradlee King on 23/01/2023.
//

import SwiftUI



struct EmotionLog: View {
    var body: some View {
        HStack {
            Button {
                print("Happy")
            } label: {
                Image(systemName: "face.smiling")
                    .resizable()
                    .frame(width:50, height: 50)
                
            }
            
            EmotionBtn(icon: "face.smiling") 

        }
        
    }
}

struct EmotionLog_Previews: PreviewProvider {
    static var previews: some View {
        EmotionLog()
    }
}


struct EmotionBtn: View {
    var icon: String
    
    var body: some View {
        Button {
            print("Button Pressed")
        } label: {
            Image(systemName: icon)
        }

    }
}
