//
//  ChatUserMessagesView.swift
//  Unshackled
//
//  Created by Bradlee King on 06/11/2022.
//

import SwiftUI
import Firebase


class ChatLogViewModel: ObservableObject {
    @Published var chatmsg = ""
    @Published var errorMessage = ""
    
    let chatUser: ChatUser?
    
    init(chatUser: ChatUser?) {
        self.chatUser = chatUser
        
    }
    
    func handleSend(text: String) {
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else {return}
        guard let toId = chatUser?.uid else {return}
        
        let document = FirebaseManager.shared.firestore
            .collection("messages")
            .document(fromId)
            .collection(toId)
            .document()
        
        
        let messageData = ["fromId": fromId, "toId": toId, "text": self.chatmsg, "timestamp": Timestamp()] as [String: Any]
        
        document.setData(messageData) {error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }
            
            print("Successfully saved current user sending Message")
            self.chatmsg = ""
        }
        
        let recipientMessageDocument = FirebaseManager.shared.firestore
            .collection("messages")
            .document(toId)
            .collection(fromId)
            .document()
        
        recipientMessageDocument.setData(messageData) {error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }
            print("Reipient Saved message as well")
        }
        
    }
}

struct ChatLogView: View {
    
    let chatUser: ChatUser?
    
    init(chatUser: ChatUser?) {
        self.chatUser = chatUser
        self.vm = .init(chatUser: chatUser)
    }
    
    @ObservedObject var vm: ChatLogViewModel
    var body: some View {
        VStack {
            ZStack{
                Text(vm.errorMessage)
                    .foregroundColor(.red)
            }
            msgview
            chatBottomBar
        }
        .navigationTitle(chatUser?.email ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var msgview: some View {
        ScrollView {
            ForEach(0..<10) { msg in
                HStack {
                    Spacer()
                    HStack {
                        Text("Placeholder")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
            }
            
            HStack {Spacer()}
        }
        .background(Color(.init(white: 0.95, alpha: 1)))
        .clipped()
    }
    
    private var chatBottomBar: some View {
        HStack(spacing: 16){
            ZStack(alignment:.leading) {
                PlaceHolderDescription
                TextEditor(text:$vm.chatmsg)
                    .opacity(vm.chatmsg.isEmpty ? 0.5 : 1)
            }
            .frame(height: 40)
            Button {
                vm.handleSend(text: self.vm.chatmsg)
            } label: {
                Text("Send")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.blue)
            .cornerRadius(5)
            
        }
        .padding(.horizontal)
        
    }
    private var PlaceHolderDescription: some View {
        Text(vm.chatmsg.isEmpty ? "Place Text Here" : "")
            .padding(.leading, 5)
    }
}
struct ChatLogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChatLogView(chatUser: .init(data:["uid": "2D1ecIq9jEadVvDIUrh3I19VkIr1", "email": "fake@gmail.com"]))
        }
    }
}
