//
//  TabBarButton.swift
//  Unshackled
//
//  Created by Bradlee King on 17/01/2023.
//

import SwiftUI

struct TabBarButton: View {
    var buttonText: String
    var seletectedImage: String
    var image: String
    var isActive: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 4){
            if isActive {
                Image(seletectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text(buttonText)
                    .font(Font.custom("Poppins-Bold", size: 10))
                    .foregroundColor(Color("DarkTurquoise"))
            } else {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text(buttonText)
                    .font(Font.custom("Poppins-Bold", size: 10))
                    .foregroundColor(.black .opacity(0.43))
            }
            
            
            
        }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(buttonText: "Planner", seletectedImage: "SelectedBook", image: "Book", isActive: false)
    }
}
