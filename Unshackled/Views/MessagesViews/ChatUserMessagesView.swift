//
//  ChatUserMessagesView.swift
//  Unshackled
//
//  Created by Bradlee King on 06/11/2022.
//

import SwiftUI
import Firebase

struct FirebaseConstants {
    static let fromId = "fromId"
    static let toId = "toId"
    static let text = "text"
    static let timestamp = "timestamp"
    static let email = "email"
}

struct ChatMessage: Identifiable {
    var id: String {documentId}
    
    let documentId:String
    
    let fromId, toId, text: String
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.fromId = data[FirebaseConstants.fromId] as? String ?? ""
        self.toId = data[FirebaseConstants.toId] as? String ?? ""
        self.text = data[FirebaseConstants.text] as? String ?? ""
    }
    
}


class ChatLogViewModel: ObservableObject {
    @Published var chatmsg = ""
    @Published var errorMessage = ""
    
    @Published var chatMessages = [ChatMessage]()
    
    let chatUser: ChatUser?
    
    init(chatUser: ChatUser?) {
        self.chatUser = chatUser
        
        fetchMessages()
        
    }
    
    private func fetchMessages() {
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else {return}
        guard let toId = chatUser?.uid else {return}
        FirebaseManager.shared.firestore
            .collection("messages")
            .document(fromId)
            .collection(toId)
            .order(by: "timestamp")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "failed to listern for messages \(error)"
                    print(error)
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        self.chatMessages.append(.init(documentId: change.document.documentID, data: data))
                    }
                })
                
                DispatchQueue.main.async {
                    self.count += 1
                }
            }
    }
    
    func handleSend(text: String) {
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else {return}
        guard let toId = chatUser?.uid else {return}
        
        let document = FirebaseManager.shared.firestore
            .collection("messages")
            .document(fromId)
            .collection(toId)
            .document()
        
        
        let messageData = [FirebaseConstants.fromId: fromId, FirebaseConstants.toId: toId, FirebaseConstants.text: self.chatmsg, "timestamp": Timestamp()] as [String: Any]
        
        document.setData(messageData) {error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }
            
            print("Successfully saved current user sending Message")
            
            self.persistRecentMessage()
            
            self.chatmsg = ""
            self.count += 1
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
            self.count += 1
        }
        
    }
    
    private func persistRecentMessage() {
        guard let chatUser = chatUser else {return}
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        guard let toId = self.chatUser?.uid else {return}
        
        let document = FirebaseManager.shared.firestore
            .collection("recent_messages")
            .document(uid)
            .collection("messages")
            .document(toId)
        
        let data = [
            FirebaseConstants.timestamp: Timestamp(),
            FirebaseConstants.text: self.chatmsg,
            FirebaseConstants.fromId: uid,
            FirebaseConstants.toId: toId,
            FirebaseConstants.email: chatUser.email
        ] as [String : Any]
        
        document.setData(data) { error in
            if let error = error {
                self.errorMessage = "Failed to save recent message: \(error)"
                return
            }
        }
    }
    
    @Published var count = 0
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
        .navigationTitle(chatUser?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarItems(trailing: Button(action: {
//            vm.count += 1
//        }, label: {
//            Text("Count: \(vm.count)")
//        }))
    }
    
    static let emptyScrollToString = "Empty"
    
    private var msgview: some View {
        ScrollView {
            ScrollViewReader{ ScrollViewProxy in
                VStack {
                    ForEach(vm.chatMessages) { message in
                        MessageView(message: message)
                    }
                    
                    HStack {Spacer()}
                        .id(Self.emptyScrollToString)
                        .padding(.top, 3)
                }
                .onReceive(vm.$count) { _ in
                    withAnimation(.easeOut(duration: 0.5)) {
                        ScrollViewProxy.scrollTo(Self.emptyScrollToString, anchor: .bottom)
                    }
                    
                }
                .onAppear{ 
                    withAnimation(.easeOut(duration: 0.5)) {
                        ScrollViewProxy.scrollTo(Self.emptyScrollToString, anchor: .bottom)
                    }
                }
                
                
                    
            }
            
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

struct MessageView: View {
    let message: ChatMessage
    var body: some View {
        VStack {
            if message.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                HStack {
                    Spacer()
                    HStack {
                        Text(message.text)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                }
               
            } else {
                HStack {
                    
                    HStack {
                        Text(message.text)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    Spacer()
                }
                            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
    
}


struct ChatLogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChatLogView(chatUser: .init(data:["uid": "2D1ecIq9jEadVvDIUrh3I19VkIr1", "email": "kingofbrad@gmail.com"]))
        }
    }
}
