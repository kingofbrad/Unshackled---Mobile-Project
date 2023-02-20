//
//  PlannerView.swift
//  Unshackled
//
//  Created by Bradlee King on 18/02/2023.
//

import SwiftUI

struct Planner: Hashable, Identifiable, Equatable {
    let id = UUID()
    let image: String
    let title: String
    let content: String
    let value: Int64
    let blob: String
}


struct PlannerView: View {
    var planner: [Planner] = [
        .init(image: "EmotionLogIcon", title: "Emotion Log", content: "PlaceHolder Text for now", value: 1, blob: "EmotionLogBlob"),
        .init(image: "CalendarIcon1", title: "Calendar", content: "PlaceHolder text for now with the calendar", value: 2, blob: "CalendarBlob"),
        
    ]
    
    @State private var emotionlog = false
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    HStack{
                        VStack(alignment: .leading){
                            Text("Planner")
                                .font(.custom("Vidaloka-Regular", size: 40))
                            Text("What shall we do today?")
                                .font(.custom("Poppins-Regular", size: 15))
                        }
                        Spacer()
                    }
                    .padding(.leading, 30)
                }
                
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 10) {

                        
                        NavigationLink(destination: MainEmotionLogView()) {
                            NavLinkLabel(title: "Emotion Log", content: "Keep track of your emotions by selecting the face that best represents how you're feeling.", blob: "EmotionLogBlob", icon: "EmotionLogIcon")
                        }
                        
                        NavigationLink(destination: MainJournalView(jvm: JournalViewModel())) {
                            NavLinkLabel(title: "Journal", content: "A blank page waiting for some thoughts. Locked behind a passcode for your comfort", blob: "JournalBlob", icon: "JournalIcon")
                        }
                        NavigationLink(destination: EmptyView()) {
                            NavLinkLabel(title: "Calendar", content: "A monthy preview of your schedule and emotions all in one.", blob: "CalendarBlob", icon: "CalendarIcon1")
                        }
                        NavigationLink(destination: EmptyView()) {
                            NavLinkLabel(title: "Goals", content: "A blank page waiting for some thoughts. Locked behind a passcode for your comfort", blob: "GoalsBlob", icon: "GoalsIcon")
                        }
                        NavigationLink(destination: EmptyView()) {
                            NavLinkLabel(title: "Letter to future self", content: "Write a letter to your future self, With suggestions on how to start, or what to say", blob: "LetterBlob", icon: "LetterIcon")
                        }
                        NavigationLink(destination: EmptyView()) {
                            NavLinkLabel(title: "Affirmations", content: "Positive words and quotes for emotional support or encouragement.", blob: "AffirmationsBlob", icon: "AffirmationsIcon")
                        }
                        NavigationLink(destination: EmptyView()) {
                            NavLinkLabel(title: "Mindfullness", content: "Learn mindfullness through some of our top tips on how to master your mind", blob: "MindfulnessBlob", icon: "MindfulnessIcon")
                        }
                        
                        
                        
                        
                        
                        
                    }
                }
            }
            .background(Color("lightpink"))
            
        }
        
        
        
    }
}



struct PlannerView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerView()
    }
}




struct BlobIcon: View {
    var blob: String
    var icon: String
    
    var body: some View {
        ZStack {
            Image(blob)
             
            Image(icon)
               
        }
        .frame(width: 50, height: 50)
    }
}



struct NavLinkLabel: View {
    var title: String
    var content: String
    var blob: String
    var icon: String
    
    var body: some View {
        VStack {
            HStack(spacing: 13) {
                BlobIcon(blob: blob, icon: icon)
                    .padding(.leading, 5)
                VStack(alignment:.leading, spacing: 5) {
                    Text(title)
                        .font(.custom("Poppins-SemiBold", size: 14))
                        .foregroundColor(Color.black)
                    Text(content)
                        .foregroundColor(Color("Silver Chalice"))
                        .font(.custom("Poppins-Regular", size: 10))
                        .multilineTextAlignment(.leading)
                      
                }
                .frame(width: 250)
                
            }
            
        }
        .frame(width: 340, height: 80)
        .background(Color.white)
        .cornerRadius(10)
        
    }
}
