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
                EmotionLog()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("lightpink"))
        }
    }
}

struct MainHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeView()
    }
}
