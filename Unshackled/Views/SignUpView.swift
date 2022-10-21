//
//  SignUpView.swift
//  Unshackled
//
//  Created by Bradlee King on 21/10/2022.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ZStack {
            Color.black
            
            RoundedRectangle(cornerRadius: 100, style: .continuous)
            .foregroundStyle(.linearGradient(colors: [Color("Turquoise"), .white], startPoint:.topLeading, endPoint:.bottomTrailing))
               
            
                .frame(width: 600, height: 400)
                .rotationEffect(.degrees(-150))
                .offset(y: -350)
        }
        .ignoresSafeArea()
    }
    
    var emailField: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Email")
            TextField("", text: $email)
                .background(Color.white)
                .frame(height: 70)
                .padding(.horizontal, 10)
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
