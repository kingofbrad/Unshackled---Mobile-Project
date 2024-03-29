//
//  EmojiArray.swift
//  Unshackled
//
//  Created by Bradlee King on 27/02/2023.
//

import Foundation


struct EmotionLogViewModel: Identifiable {
    var id = UUID()
    let icon: String
    let text: String
}


struct EmojiArray {
    
    var EmotionBtnArray: [EmotionLogViewModel] =
    [
        .init(icon: "happy", text: "Happy"),
        .init(icon: "sad-2", text: "Sad"),
        .init(icon: "sad-3", text: "Angry"),
        .init(icon: "surprise", text: "Shocked"),
        .init(icon: "smile", text: "Loved"),
        .init(icon: "smile-2", text: "Okay"),
        .init(icon: "crazy", text: "Playful"),
        .init(icon: "happy-2", text: "Excited"),
        .init(icon: "happy-3 4", text: "Relieved"),
        .init(icon: "unsure", text: "Unsure"),
        .init(icon: "sad", text: "Upset"),
        .init(icon: "crying", text: "Teary"),
        .init(icon: "meh", text: "Nothing"),
        .init(icon: "muted", text: "Silenced"),
        .init(icon: "yawn", text: "Tired"),
        .init(icon: "cute", text: "Shy"),
        .init(icon: "sceptic", text: "Dead"),
        .init(icon: "blush", text: "Hopeful"),
        .init(icon: "ill", text: "Unwell"),
    ]
    
    var EmotionTestArray: [EmotionLogViewModel] =
    [
        
    ]
    
    var EmotionArrayHappy: [EmotionLogViewModel] =
    [
        .init(icon: "happy", text: "Happy"),
        .init(icon: "surprise", text: "Shocked"),
        .init(icon:"smile", text:"Loved"),
        .init(icon: "happy-2", text: "Excited"),
        .init(icon: "happy-3 4", text: "Relieved"),
        .init(icon: "blush", text: "Hopeful")
    ]
    
    var EmotionArraySad: [EmotionLogViewModel] =
    [
        .init(icon: "sad-2", text: "Sad"),
        .init(icon: "sad-3", text: "Angry"),
        .init(icon: "sad", text: "Upset"),
        .init(icon: "crying", text: "Teary"),
        .init(icon: "ill", text: "Unwell"),
    ]

    var EmojiArrayOther: [EmotionLogViewModel] =
    [
        .init(icon: "sceptic", text: "Dead"),
        .init(icon: "meh", text: "Silenced"),
        .init(icon: "unsure", text: "Unsure"),
        
    ]
    
}

