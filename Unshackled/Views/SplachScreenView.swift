//
//  SplachScreenView.swift
//  Unshackled
//
//  Created by Bradlee King on 21/10/2022.
//

import SwiftUI

struct SplachScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            LoginScreenView()
        } else {
            ZStack {
                Color.black
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [Color("Turquoise"), .blue], startPoint:.topLeading, endPoint:.bottomTrailing))
                    .frame(width: 1000, height: 400)
                    .rotationEffect(.degrees(-150))
                    .offset(y: -350)
                VStack{
                    VStack(spacing: 40){
                        Image(systemName: "leaf.fill")
                            .font(.system(size: 80))
                            .foregroundColor(Color("Turquoise"))
                        Text("UNSHACKLED")
                            .font(Font.custom("Baskerville-Bold", size: 30))
                            .foregroundColor(.white.opacity(0.80))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
            }
            }
            .ignoresSafeArea()
        }
        
        
        
    }
}

struct SplachScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplachScreenView()
    }
}
