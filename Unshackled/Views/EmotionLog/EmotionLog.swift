//
//  EmotionLog.swift
//  Unshackled
//
//  Created by Bradlee King on 23/01/2023.
//

import SwiftUI


struct EmotionLogViewModel: Identifiable {
    var id = UUID()
    let icon: String
    let text: String
}

struct EmotionLog: View {
    var emojiArray = EmojiArray()
    
    @State var moreEmojiToggle: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            Section {
                HStack {
                    ForEach(emojiArray.EmotionBtnArray.prefix(5)) { item in
                        EmotionBtn(icon: item.icon, text: item.text, isTextUsed: true) {
                            print("happy")
                        }
                    }
                    EmotionBtn(icon: "unsure", text: "") {
                        moreEmojiToggle = true
                    }.sheet(isPresented: $moreEmojiToggle) {
                        EmptyView()
                    }
                   
                }
            } header: {
                Text("Emotion Log")
            }
        }
    }
}

struct EmotionLog_Previews: PreviewProvider {
    static var previews: some View {
        EmotionLog()
    }
}



struct ExpandedSection_Preview: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}


struct EmotionBtn: View {
    var icon: String
    var text: String
    var isTextUsed: Bool = false
    var clickedBtn: (() -> Void)
    var body: some View {
        Button(action: clickedBtn) {
            VStack{
                Image(icon)
                    .resizable()
                    .frame(width:20, height: 20)
                    .foregroundColor(.black)
                if isTextUsed {
                    Text(text)
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                }
                
                
            }
            .frame(width:100, height: 100)
            .background(Color("VistaWhite"))
            .cornerRadius(50)
        }
        .frame(width: 35, height: 35)
        .padding(9)
        .background(Color(.white))
        .cornerRadius(10)
        
        
        
        
        
    }
    
}


struct EmojiBtn: View {
    var icon: String
    var text: String
    var isTextUsed: Bool = false
    var btnFunc: (() -> Void)
    var body: some View {
        Button(action: btnFunc) {
            VStack {
                Image(icon)
                    .resizable()
                    .frame(maxWidth: 30, maxHeight: 30)
                
                
                Text(text)
                    .font(.custom("Poppins-Regular", size: 16))
                    .foregroundColor(.primary)
            }
        }
        .frame(width: 70, height: 70)
        .background(Color(.purple))
        .cornerRadius(10)
        
    }
}



