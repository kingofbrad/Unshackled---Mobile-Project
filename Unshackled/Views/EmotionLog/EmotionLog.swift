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
        VStack(alignment: .leading) {
            Section {
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
                    EmotionBtn(icon: "smile", text: "Loved") {
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
                    .frame(width: 35, height: 35)
                    .padding(9)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .sheet(isPresented: $moreEmojiToggle) {
                        ExpandedSection()
                    }
                }
            } header: {
                Text("Emotion Log")
                    .padding(.leading, -10)
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
            VStack(alignment: .leading, spacing: 25) {
                Text("Please select a emoji to represent your mood")
                    .font(.custom("Poppins-Regular", size: 18))
                    
                
                Section {
                    HStack {
                        EmojiBtn(icon: "happy", text: "Happy") {
                            print("Happy")
                        }
                        EmojiBtn(icon: "smile", text: "Loved") {
                            print("Loved")
                        }
                        EmojiBtn(icon: "crazy", text: "Playful") {
                            print("Loved")
                        }
                        EmojiBtn(icon: "happy-2", text: "Excited") {
                            print("Loved")
                        }
                        EmojiBtn(icon: "happy-3 4", text: "Relieved") {
                            print("Relieved")
                        }
                    }
                    
                    
                } header: {
                    Text("Carmful Moods")
                        .font(.custom("Poppins-SemiBold", size: 20))
                }
                
                Section {
                    HStack(spacing: 10) {
                        EmotionBtnExpanded(icon: "happy", text: "Sad") {
                            print("happy")
                        }
                        EmotionBtnExpanded(icon: "smile-2", text: "Upset") {
                            print("happy")
                            
                        }
                        EmotionBtnExpanded(icon: "happy-3 4", text: "Angry") {
                            print("happy")
                            
                        }
                        EmotionBtnExpanded(icon: "smile", text: "Teary") {
                            print("happy")
                            
                        }
                        EmotionBtnExpanded(icon: "blush", text: "Drained") {
                            print("happy")
                            
                        }
                        EmotionBtnExpanded(icon: "cute", text: "Silenced") {
                            print("happy")
                            
                        }
                        Spacer()
                    }
                    .frame(width:.infinity, height: 100)
                    .padding(.horizontal, 6)
                    .background(Color(.white))
                    .cornerRadius(30)
                    
                } header: {
                    Text("Sad Moods")
                        .font(.custom("Poppins-SemiBold", size: 20))
                }
                Spacer()
            }
            .navigationTitle("Additional moods")
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightpink"))
            
        }
    }
}

struct ExpandedSection_Preview: PreviewProvider {
    static var previews: some View {
        ExpandedSection()
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
                    .frame(width:20, height: 20)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 12))
            }
            .frame(width:100, height: 100)
            .background(Color("white"))
            .cornerRadius(50)
        }
        .frame(width: 35, height: 35)
        .padding(9)
        .background(Color(.white))
        .cornerRadius(10)
        
        
        
        
        
    }
    
}

struct EmotionBtnExpanded: View {
    
    var icon: String
    var text: String
    var btnFunc: (() -> Void)
    var body: some View {
        VStack {
            Button(action: btnFunc) {
                VStack {
                    Image(icon)
                    Text(text)
                        .font(.custom("Poppins-Regular", size: 15))
                        .foregroundColor(Color(.darkText))
                }
                
            }
            
        }
        
        
    }
}


struct EmojiBtn: View {
    var icon: String
    var text: String
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
