//
//  MainEmotionLogView.swift
//  Unshackled
//
//  Created by Bradlee King on 15/02/2023.
//

import SwiftUI

var emojis = ["happy", "crying", "smile", "sceptic", "meh"]

struct MainEmotionLogView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                Text("Emotion Log")
                    .font(.custom("Vidaloka-Regular", size: 40))
                Text("What have you been up to?")
                    .font(.custom("Poppins-SemiBold", size: 15))
                
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            EmojiBtnScrollView(image: "crying") {
                                print("Happy pressed")
                            }
                            EmojiBtnScrollView(image: "smile") {
                                print("Happy pressed")
                            }
                            EmojiBtnScrollView(image: "sceptic") {
                                print("Happy pressed")
                            }
                            EmojiBtnScrollView(image: "happy") {
                                print("Happy pressed")
                            }
                            EmojiBtnScrollView(image: "meh") {
                                print("Happy pressed")
                            }
                            EmojiBtnScrollView(image: "happy") {
                                print("Happy pressed")
                            }
                            EmojiBtnScrollView(image: "happy") {
                                print("Happy pressed")
                            }
                            EmojiBtnScrollView(image: "happy") {
                                print("Happy pressed")
                            }
                        }
                    }
                    .frame(height: 70)
                } header: {
                    HStack {
                        Text("Activites")
                        Button {
                            print("Activies")
                        } label: {
                            Image("CalendarIcon")
                        }
                        
                    }
                }
                
            }
            Spacer()
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
