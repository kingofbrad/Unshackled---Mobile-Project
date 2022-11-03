//
//  NewMessageContactView.swift
//  Unshackled
//
//  Created by Bradlee King on 01/11/2022.
//

import SwiftUI

class CreateNewMessageViewModel: ObservableObject {
    @Published var users = [ChatUser]()
    @State var errorMessage = ""
    
    init() {
        fetchAllUsers()
    }
    
    private func fetchAllUsers() {
        FirebaseManager.shared.firestore.collection("users")
            .getDocuments { documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch users \(error)"
                    print("Failed to fetch users: \(error)")
                    return
                }
                
                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    let user = ChatUser(data: data)
                    if user.uid != FirebaseManager.shared.auth.currentUser?.uid {
                        self.users.append(.init(data:data))
                    }
                   
                })
                
            }
    }
}

struct NewMessageContactView: View {
    
    let didSelectNewUser: (ChatUser) -> ()
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm = CreateNewMessageViewModel()
    @State private var searchUser = ""
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView{
                    Text(vm.errorMessage)
                    
                    ForEach(vm.users) {user in
                        Button{
                            presentationMode.wrappedValue.dismiss()
                            didSelectNewUser(user)
                        } label: {
                            VStack(alignment: .leading) {
                                HStack(spacing: 16) {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 32))
                                    Text(user.email)
                                        .font(.system(size: 20))
                                    
                                }
                                .padding(.horizontal)
                                Divider()
                                    .padding(.vertical, 8)
                            }
                        }
                       
                    }
                }
                .searchable(text: $searchUser)
                .navigationTitle("New Message")
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
                
            }
        }
    }
}

struct NewMessageContactView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageContactView(didSelectNewUser: {user in
            print(user.email)
        })
    }
}
