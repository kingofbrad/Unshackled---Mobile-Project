//
//  SignUpStage2View.swift
//  Unshackled
//
//  Created by Bradlee King on 19/11/2022.
//

import SwiftUI

struct SignUpStage2View: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 73)
                .foregroundColor(Color("lightpink"))
                .frame(width: 600, height: 400)
                .offset(x: -85, y: -410)
            
            VStack{
                VStack(alignment: .leading){
                    HStack {
                        Text("Let's create an account for you")
                            .font(.custom("Vidaloka-Regular", size: 40))
                            .frame(width: 270)
                            .offset(x: -40, y: 50)
                    }
                    
                    Spacer()
                    
                }
            }
        }
    }
}

struct SignUpStage2View_Previews: PreviewProvider {
    static var previews: some View {
        SignUpStage2View()
    }
}
