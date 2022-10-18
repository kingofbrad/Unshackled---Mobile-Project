//
//  SecondWidget.swift
//  Unshackled
//
//  Created by Bradlee King on 11/10/2022.
//

import SwiftUI

struct SecondWidget: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .frame(width: 200, height: 200)
                
            Text("Hello there")
                
        }
    }
}

struct SecondWidget_Previews: PreviewProvider {
    static var previews: some View {
        SecondWidget()
    }
}
