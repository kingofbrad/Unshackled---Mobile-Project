//
//  MainEmotionLogView.swift
//  Unshackled
//
//  Created by Bradlee King on 15/02/2023.
//

import SwiftUI
import UIKit
import Firebase






struct MainEmotionLogView: View {
    @ObservedObject var evm: EmojiViewModel
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
                HStack(spacing: -20) {
                    ForEach(evm.emoji) { emoji in
                        moodDataView(emoji: emoji, evm: EmojiViewModel())
                        
                    }
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
        MainEmotionLogView(evm:EmojiViewModel())
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


struct moodDataView: View {
    let emoji: Emojis
    @ObservedObject var evm: EmojiViewModel
    @State private var isAddJournalOpen: Bool = false
    var body: some View {
        VStack {
            if emoji.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                if !evm.NoEntryfound {
                    VStack {
                        EmotionBtn(icon: emoji.mood, text: emoji.text) {
                            print("")
                        }
                    }
                    .padding(.horizontal)
                    
                } else {
                    VStack{
                        Text("Please add a new entry")
                    }
                }
                
            }
           
        }
    }
}
