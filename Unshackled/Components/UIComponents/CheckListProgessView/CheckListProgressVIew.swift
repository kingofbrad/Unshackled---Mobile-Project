//
//  CheckListProgressVIew.swift
//  Unshackled
//
//  Created by Bradlee King on 27/11/2022.
//

import SwiftUI

struct CheckListProgressView: View {
    @State var isChecked: Bool
    @State  var isChecked1: Bool
    @State  var isChecked2: Bool
    @State  var isChecked3: Bool
    
    var body: some View {
        if isChecked {
            HStack(spacing: -0.4){
                Circle()
                    .foregroundColor(Color("lightTurquoise"))
                    .frame(width: 40)
                Rectangle()
                    .foregroundColor(Color("lightpink"))
                    .frame(width: 50, height: 10)
                Circle()
                    .foregroundColor(Color("lightpink"))
                    .frame(width: 40)
                Rectangle()
                    .foregroundColor(Color("lightpink"))
                    .frame(width: 50, height: 10)
                Circle()
                    .foregroundColor(Color("lightpink"))
                    .frame(width: 40)
            }
        } else if isChecked1 {
            HStack(spacing: -0.4){
                    Image(systemName: "checkmark")
                      .resizable()
                      .frame(width: 20, height: 20)
                      .foregroundColor(.black)
                      .padding(10)
                      .background(Color("lightTurquoise"))
                      .clipShape(Circle())
                    Rectangle()
                        .foregroundColor(Color("lightTurquoise"))
                        .frame(width: 50, height: 10)
                    Circle()
                        .foregroundColor(Color("lightTurquoise"))
                        .frame(width: 40)
                    Rectangle()
                        .foregroundColor(Color("lightpink"))
                        .frame(width: 50, height: 10)
                    Circle()
                        .foregroundColor(Color("lightpink"))
                        .frame(width: 40)
            }
            .padding(.bottom, 30)
        } else if isChecked2 {
            HStack(spacing: -0.4){
                    Image(systemName: "checkmark")
                      .resizable()
                      .frame(width: 20, height: 20)
                      .foregroundColor(.black)
                      .padding(10)
                      .background(Color("lightTurquoise"))
                      .clipShape(Circle())
                    Rectangle()
                        .foregroundColor(Color("lightTurquoise"))
                        .frame(width: 50, height: 10)
                    Image(systemName: "checkmark")
                      .resizable()
                      .frame(width: 20, height: 20)
                      .foregroundColor(.black)
                      .padding(10)
                      .background(Color("lightTurquoise"))
                      .clipShape(Circle())
                    Rectangle()
                        .foregroundColor(Color("lightTurquoise"))
                        .frame(width: 50, height: 10)
                    Circle()
                        .foregroundColor(Color("lightTurquoise"))
                        .frame(width: 40)
            }
            .padding(.bottom, 30)
        } else if isChecked3 {
            HStack(spacing: -0.4){
                    Image(systemName: "checkmark")
                      .resizable()
                      .frame(width: 20, height: 20)
                      .foregroundColor(.black)
                      .padding(10)
                      .background(Color("lightTurquoise"))
                      .clipShape(Circle())
                    Rectangle()
                        .foregroundColor(Color("lightTurquoise"))
                        .frame(width: 50, height: 10)
                    Image(systemName: "checkmark")
                      .resizable()
                      .frame(width: 20, height: 20)
                      .foregroundColor(.black)
                      .padding(10)
                      .background(Color("lightTurquoise"))
                      .clipShape(Circle())
                    Rectangle()
                        .foregroundColor(Color("lightTurquoise"))
                        .frame(width: 50, height: 10)
                    Image(systemName: "checkmark")
                      .resizable()
                      .frame(width: 20, height: 20)
                      .foregroundColor(.black)
                      .padding(10)
                      .background(Color("lightTurquoise"))
                      .clipShape(Circle())
            }
            .padding(.bottom, 30)
        }
    }
}

struct CheckListProgressVIew_Previews: PreviewProvider {
    static var previews: some View {
        CheckListProgressView(isChecked: true,isChecked1: false, isChecked2: false, isChecked3: false)
    }
}
