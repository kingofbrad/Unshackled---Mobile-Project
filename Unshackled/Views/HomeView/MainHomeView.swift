//
//  MainHomeView().swift
//  Unshackled
//
//  Created by Bradlee King on 18/01/2023.
//

import SwiftUI

struct MainHomeView: View {
    var body: some View {
        NavigationStack {
            
            VStack{
                HStack {
                    greetingSection
                    Spacer()
                }
                .padding(.horizontal, 30)
                ZStack(alignment: .center) {
                    HStack{
                        Image("HomeBorder")
                            .resizable()
                            .frame(width: 360, height: 90)
                    }
                    Text("I will not worry about things I cannot control.")
                        .font(.custom("Poppins-Regular", size: 16))
                        .frame(width: 290)
                        .lineSpacing(3)
                        .tracking(4)
                }
                EmotionLog(evm: EmojiViewModel())

                
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightpink"))
            
        }
        
    }
    var greetingSection: some View {
            VStack(alignment: .leading) {
                Text("Morning,")
                    .font(.custom("Vidaloka-Regular", size: 40))
                Text("How are you today?")
                    .font(.custom("Poppins-SemiBold", size: 15))
            }
        
        
    }
    
    
}

struct MainHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeView()
    }
}
