//
//  CheckListProgressVIew.swift
//  Unshackled
//
//  Created by Bradlee King on 27/11/2022.
//

import SwiftUI


enum ProgressTabs: Int {
    case checked = 0
    case checked1 = 1
    case checked2 = 2
    case checked3 = 3
}




struct Checked: View {
    var body: some View {
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
        .onAppear {
            
        }
    }
}

struct Checked1: View {
    var body: some View {
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
    }
}

struct Checked2: View {
    var body: some View {
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
        
    }
}

struct Checked3: View{
    var body: some View {
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
    }
}


