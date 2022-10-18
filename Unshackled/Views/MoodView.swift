//
//  MoodView.swift
//  Unshackled
//
//  Created by Bradlee King on 11/10/2022.
//

import SwiftUI

struct MoodView: View {
    var body: some View {
       Image(systemName: "face.smiling.fill")
            .resizable()
            .frame(width:100, height: 100)
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}
