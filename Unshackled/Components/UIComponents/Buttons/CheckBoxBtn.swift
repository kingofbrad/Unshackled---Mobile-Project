//
//  CheckBoxBtn.swift
//  Unshackled
//
//  Created by Bradlee King on 22/10/2022.
//
import Foundation
import SwiftUI

struct ToggleCheckBoxStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        }label: {
            Image(systemName: "checkmark.square")
                .symbolVariant(configuration.isOn ? .fill : .none)
        }
        

    }
}
