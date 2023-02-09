//
//  EmotionLog.swift
//  Unshackled
//
//  Created by Bradlee King on 23/01/2023.
//

import SwiftUI



struct EmotionLog: View {
    @State var moreEmojiToggle: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                EmotionBtn(icon: "happy", text: "Happy") {
                    print("happy")
                }
                EmotionBtn(icon: "sad-2", text: "Sad") {
                    print("Sad")
                }
                EmotionBtn(icon: "sad-3", text: "Angry") {
                    print("Angry")
                }
                EmotionBtn(icon: "surprise", text: "Shocked") {
                    print("Shocked")
                }
                Button{
                    moreEmojiToggle.toggle()
                } label: {
                    VStack{
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width:25, height: 25)
                            .foregroundColor(.black)
                        
                    }
                    .frame(width:100, height: 100)
                    .background(Color(moreEmojiToggle ? "VistaWhite" : "White"))
                    .cornerRadius(50)
                }
                .frame(width: 50, height: 50)
                .padding(10)
                .background(Color(.white))
                .cornerRadius(10)
                .sheet(isPresented: $moreEmojiToggle) {
                    ExpandedSection()
                }
            }
        }
    }
}

struct EmotionLog_Previews: PreviewProvider {
    static var previews: some View {
        EmotionLog()
    }
}


struct ExpandedSection: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("sad")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightpink"))
        }
    }
}




struct EmotionBtn: View {
    var icon: String
    var text: String
    var clickedBtn: (() -> Void)
    var body: some View {
        Button(action: clickedBtn) {
            VStack{
                Image(icon)
                    .resizable()
                    .frame(width:25, height: 25)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 12))
            }
            .frame(width:100, height: 100)
            .background(Color("white"))
            .cornerRadius(50)
        }
        .frame(width: 50, height: 50)
        .padding(10)
        .background(Color(.white))
        .cornerRadius(10)
        
        
        
        
        
    }
    
}
