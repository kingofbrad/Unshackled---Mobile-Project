//
//  DOBPicker.swift
//  Unshackled
//
//  Created by Bradlee King on 08/04/2023.
//

import SwiftUI




class dobViewModel: ObservableObject {
    @Published var birthDate = Date()
    @Published var name = ""
    func UpdateUserInformation() {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        
        
        let userData = [
            "dateOfBirth": self.birthDate,
            "name": self.name
        ] as [String : Any]
        
        
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData as [String : Any]) { err in
                if let err = err {
                    print(err)
                    return
                }
                print("Success")
                
                
            }
    }
    
    
}

extension Date {
    var displayFormatMonth: String {
        self.formatted(.dateTime.month(.wide))
}
    var displayFormatDay: String {
        self.formatted(.dateTime.day(.defaultDigits))
    }
    var displayFormatYear: String {
        self.formatted(.dateTime.year(.defaultDigits))
    }
}



struct DOBPicker: View {
    @StateObject var dvm = dobViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            
            
            HStack {
                Text("Date of Birth")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .fontWeight(.heavy)
                    .padding(.horizontal, -5)
                    .padding(.bottom, -4)
                
                DOBPickerView(date: $dvm.birthDate)
            }
            HStack(spacing: 15) {
                Text("\(dvm.birthDate.displayFormatDay)")
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 80, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                Text("\(dvm.birthDate.displayFormatMonth)" )
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 150, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
                Text(dvm.birthDate.displayFormatYear )
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(width: 80, height: 50)
                    .background(Color(.init(white: 0.9, alpha: 0.3)))
                    .cornerRadius(10)
            }
        }
        
    }
}



struct DOBPicker_Previews: PreviewProvider {
    static var previews: some View {
        DOBPicker(dvm: dobViewModel())
    }
}

struct DOBPickerView: View {
    @Binding var date: Date
    
    var  body: some View {
        Image(systemName: "calendar")
            .overlay {
                DatePicker("", selection: $date, in: ...Date.now, displayedComponents: .date)
                    .blendMode(.destinationOver)
            }
    }
}
