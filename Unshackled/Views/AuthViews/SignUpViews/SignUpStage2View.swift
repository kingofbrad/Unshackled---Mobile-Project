//
//  SignUpStage2View.swift
//  Unshackled
//
//  Created by Bradlee King on 19/11/2022.
//

import SwiftUI
import Combine

struct SignUpStage2View: View {
    @State private var name = ""
    @State private var CheckBoxToggle = false
    @State private var createAccountProgress = true
    @State private var showErrorMessage = false
    @State private var dobDay = ""
    @State private var dobMonth = ""
    @State private var dobYear = ""
    
    @State private var location = ""
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15){
                HStack {
                    Text("Let's create an account for you")
                        .font(.custom("Vidaloka-Regular", size: 40))
                        .frame(width: 270)
                        .padding(.top, -30)
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 45)

                Spacer()
                
                if createAccountProgress {
                    createAccountStage2View
                        .transition(.moveAndFade)
                } else {
                    createAccountStage1View
                }
                
                
            }
            .frame(maxHeight: .infinity)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .background {
                RoundedRectangle(cornerRadius: 73)
                    .foregroundColor(Color("lightpink"))
                    .frame(width: 600, height: 400)
                    .offset(x: -85, y: -410)
            }
        }
        .toolbar(.hidden)
        
    }
    
    var createAccountStage1View: some View {
        VStack {
            CheckListProgressView(isChecked: false, isChecked1: true, isChecked2: false, isChecked3: false )
            accountDetailsInputFieldsView
            locationView
            nextButtonViewStage1
            
        }
    }
    
    var createAccountStage2View: some View {
        VStack{
            CheckListProgressView(isChecked: false, isChecked1: false, isChecked2: true, isChecked3: false)
            VStack{
                mobileNumberView
                nextButtonViewStage2
            }
            
            
        }
        .onAppear {
            withAnimation(.easeIn(duration: 4)) {
                    
            }
        }
    }
    
    var nextButtonViewStage1: some View {
        HStack {
            CustomButtonPrev(text: "Prev") {
                createAccountProgress = false
            }
            CustomButtonNext(text: "Next") {
                if CheckBoxToggle{
                    createAccountProgress = true
                } else {
                    showErrorMessage = true
                }
                
            }
            
            
            
            
        }
        .padding(.vertical, 20)
    }
    
    var nextButtonViewStage2: some View {
        HStack {
            CustomButtonPrev(text: "Prev") {
                createAccountProgress = false
            }
            CustomButtonNext(text: "Next") {
                print("Next")
            }
            
            
        }
        .padding(.vertical, 20)
    }
    
    
//    Stage 1 Views
    var accountDetailsInputFieldsView: some View{
        VStack{
            VStack(alignment:.leading) {
                Text("Name")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .fontWeight(.heavy)
                    .padding(.horizontal, -5)
                    .padding(.bottom, -4)
                TextField("", text: $name)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 340, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
            }
            
            HStack{
                Text("I give permission for the app or support survivors to all call me by my name. Your name will not be seen by other users.")
                    .font(.system(size: 15))
                CheckBox
                
            }
            .frame(width: 350, height:100)
            .padding(.horizontal, 20)
            .padding(.vertical, 0)
            if showErrorMessage {
                Text("Please agree to continue")
                    .foregroundColor(.red)
                    .font(.custom("Poppins-Bold", size: 14))
            }
            
            dobView
            
            
        }
    }
    
    var dobView: some View {
        VStack(alignment: .leading) {
            Text("Date of Birth")
                .font(.custom("Poppins-SemiBold", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, -5)
                .padding(.bottom, -4)
            HStack(spacing: 15) {
                TextField("", text: $dobDay)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 80, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                TextField("", text: $dobMonth)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 150, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                TextField("", text: $dobYear)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 80, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
            }
        }
    }
    
    var locationView: some View {
        VStack(alignment: .leading) {
            Text("Location")
                .font(.custom("Poppins-SemiBold", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, -5)
                .padding(.bottom, -4)
            HStack {
                TextField("", text: $location)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 300, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                Button {
                    print("location")
                } label: {
                    Image(systemName: "location")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                }
                
            }
        }
    }
//    Stage 2 Views
    
    var mobileNumberView: some View {
        VStack {
            Text("Mobile Number")
                .font(.custom("Poppins-SemiBold", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, -5)
                .padding(.bottom, -4)
            HStack {
                

            }
            
        }
    }
    
    
    
    
//    Components for ViewPage
    var CheckBox: some View {
        Button {
            CheckBoxToggle.toggle()
        } label: {
            Image(systemName: "checkmark.square.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(Color(!CheckBoxToggle ? "Gray" : "DarkTurquoise"))
        }
        
    }
}

struct SignUpStage2View_Previews: PreviewProvider {
    static var previews: some View {
        SignUpStage2View()
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}
