//
//  SplashScreenView.swift
//  Unshackled
//
//  Created by Bradlee King on 03/12/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var isActive: Bool = false
    
    @StateObject var avm = AuthenticationViewModel()
    
    
    var body: some View {
        if !isActive {
            VStack {
                VStack(spacing: 20) {
                    Image("MainAppIcon")
                        .resizable()
                        .frame(width: 121, height: 31)
                    Image("IconName")
                    
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("DarkTurquoise"))
                .onAppear{
                    withAnimation(.easeIn(duration: 1.1)) {
                        self.size = 0.9
                        self.opacity = 1
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        } else {
            
            if avm.onBoardingState == .yes {
                passCodeView()
            } else {
                MainOnBoardingView(vm: SignUpViewModal(), ovm: onBoardingViewModel())
            }
            
            
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
