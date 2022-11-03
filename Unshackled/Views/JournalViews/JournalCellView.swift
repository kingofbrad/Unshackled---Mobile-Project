//
//  JournalCellView.swift
//  Unshackled
//
//  Created by Bradlee King on 01/11/2022.
//

import SwiftUI

struct JournalCellView: View {
    @ObservedObject var vm: JournalViewModel
    
    
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text(vm.journal?.title ?? "")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Text("this is the demo text for the cell... ")
                    Text("01/11/22")
                        .font(.system(size:18, weight: .light))
                        .foregroundColor(Color(.darkGray))
                }
                .padding()
                Spacer()
                
                Image(systemName: "chevron.right")
                
            }
            .padding(.horizontal)
            
            
        }
        .background(Color(.init(white: 0, alpha: 0.1)))
        
    }
    
    func fetchEntry() {
        
    }
}

struct JournalCellView_Previews: PreviewProvider {
    static var previews: some View {
        JournalCellView(vm: JournalViewModel())
    }
}
