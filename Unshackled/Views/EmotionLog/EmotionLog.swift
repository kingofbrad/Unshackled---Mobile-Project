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
            EmotionBtn(icon: "face.smiling", text: "Happy")
            EmotionBtn(icon: "face.smiling", text: "Sad")
            EmotionBtn(icon: "face.smiling", text: "Angry")
            EmotionBtn(icon: "face.smiling", text: "Shocked")
            EmotionBtn(icon: "face.smiling", text: "Loved")
            EmotionBtn(icon: "plus", text: "")

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
    var text: String
    
    var body: some View {
            Button {
                print("Button Pressed")
            } label: {
                VStack{
                    Image(systemName: icon)
                        .resizable()
                        .frame(width:25, height: 25)
                        .foregroundColor(.black)
                    Text(text)
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                }
        }
            .frame(width: 50, height: 50)
            .padding(10)
            .background(Color(.white))
            .cornerRadius(10)
            
        
        
        

    }
}
