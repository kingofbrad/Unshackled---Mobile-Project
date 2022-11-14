//
//  JournalCellView.swift
//  Unshackled
//
//  Created by Bradlee King on 01/11/2022.
//

import SwiftUI

struct JournalCellView: View {
    @ObservedObject var jvm: JournalViewModel
    
    
    
    var body: some View {
        Text("Hello")
        
    }
    
    func fetchEntry() {
        
    }
}

struct JournalCellView_Previews: PreviewProvider {
    static var previews: some View {
        JournalCellView(jvm: JournalViewModel())
    }
}
