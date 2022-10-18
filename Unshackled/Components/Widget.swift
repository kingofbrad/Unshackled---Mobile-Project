//
//  Widget.swift
//  Unshackled
//
//  Created by Bradlee King on 11/10/2022.
//

import SwiftUI

struct Widget: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color("Turquoise"))
                .frame(width: 200, height: 200)
                
            Text("Hello there")
                
        }
    }
}

struct Widget_Previews: PreviewProvider {
    static var previews: some View {
        Widget()
    }
}
