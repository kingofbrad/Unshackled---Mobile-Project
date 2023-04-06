//
//  EmotionLog.swift
//  Unshackled
//
//  Created by Bradlee King on 23/01/2023.
//

import SwiftUI




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
                    Button {
                        print("More Emojis Expanded")
                        moreEmojiToggle = true
                    } label:{
                        VStack{
                            
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width:20, height: 20)
                                .foregroundColor(.black)
                        }
                        .frame(width:100, height: 100)
                        .background(Color(moreEmojiToggle ? "VistaWhite" : "White"))
                        .cornerRadius(50)
                    }
                    .frame(width: 35, height: 35)
                    .padding(9)
                    .background(Color(.white))
                    .cornerRadius(50)
                    .sheet(isPresented: $moreEmojiToggle) {
                        MoreEmojis(evm: EmojiViewModel())
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



struct MoreEmojis_Preview: PreviewProvider {
    static var previews: some View {
        MoreEmojis(evm: EmojiViewModel())
        
    }
}

struct MoreEmojis: View {
    @ObservedObject var evm: EmojiViewModel
    
    @State private var text: String = "Shocked"
    @State private var mood: String = "happy-2"
    
    var body: some View {
        VStack {
            
            
            EmotionBtn(icon: "happy-2", text: "Shocked") {
                evm.handleAddEntry(text: text, mood: mood)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("lightpink"))
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
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 12))
            }
            .frame(width:100, height: 100)
            .background(Color("White"))
            .cornerRadius(50)
        }
        .frame(width: 35, height: 35)
        .padding(9)
        .background(Color(.white))
        .cornerRadius(10)
    }
    
}




