
import SwiftUI

class MainMessagesViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var chatUser: ChatUser?
    @Published var isUserCurrentlyLoggedOut = false
    
    init() {
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
        }
        
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
   
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return}
        
        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to get current user \(error)")
                return
            }
            
            guard let data = snapshot?.data() else {
                self.errorMessage = "No Data Found"
                return}
//            self.errorMessage = "\(data)"
            
            self.chatUser = .init(data: data)
            
            
           
        }
    }
    
    
    func handleSignOut() {
        isUserCurrentlyLoggedOut.toggle()
        try? FirebaseManager.shared.auth.signOut()
    }
    
}



struct MainMessagesView: View {
    @State var shouldShowLogOutOptions = false
    @State private var refresh: Bool = false
    @State var chatUser: ChatUser?
    @State var shouldNavigateToChatLogView = false
    
    @ObservedObject private var vm = MainMessagesViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
//                Text(vm.errorMessage)
                customNavBar
                messagesView
                
                NavigationLink("", isActive: $shouldNavigateToChatLogView) {
                    ChatLogView(chatUser: self.chatUser)
                }
            }
            .overlay(
                newMessageBtn, alignment: .bottom)
            .navigationBarHidden(true)
        }
    }
    
    var messagesView: some View {
        ScrollView {
            ForEach(0..<16, id: \.self) { num in
                VStack {
                    NavigationLink {
                        Text(chatUser?.firstname ?? "No Users")
                    } label: {
                        HStack(spacing: 16){
                            VStack(alignment: .leading){
                                Text("Username")
                                    .font(.system(size: 16, weight: .bold))
                                Text("Message sent to user")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(.lightGray))
                            }
                            Spacer()
                            Text("22d")
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 8)
                }
                .padding(.horizontal)
            }
        }
        .padding(.bottom, 50)
    }
    
    @State var shouldShowNewMessageScreen = false
    
    var newMessageBtn: some View {
        Button {
            shouldShowNewMessageScreen.toggle()
        } label: {
            HStack{
                Spacer()
                Text("+ New Message")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical, 9)
            .background(Color.blue)
            .cornerRadius(24)
            .padding(.horizontal)
            .shadow(radius: 15)
            
        }
        .fullScreenCover(isPresented: $shouldShowNewMessageScreen){
            NewMessageContactView(didSelectNewUser: {user in
                print(user.email)
                self.shouldNavigateToChatLogView.toggle()
                self.chatUser = user
            })
        }
        
        
    }
    
    var customNavBar: some View {
        HStack(spacing: 16){
            VStack(alignment: .leading, spacing: 4){
                HStack {
                    Text("\(vm.chatUser?.firstname ?? "")")
                        .font(.system(size: 24, weight: .bold))
                    Text("\(vm.chatUser?.lastname ?? "")")
                        .font(.system(size: 24, weight: .bold))
                }
                HStack{
                    Circle()
                        .foregroundColor(.green)
                        .frame(width:14,height: 14)
                    Text("online")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.lightGray))
                }
            }
            Spacer()
            Button{
                shouldShowLogOutOptions.toggle()
                
                
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
            }
        }
        .padding()
        .actionSheet(isPresented: $shouldShowLogOutOptions) {
            .init(title: Text("Settings"), message: Text("What do you want me to do??"), buttons: [
                .destructive(Text("Sign Out"), action: {
                    print("handle sign out")
                    vm.handleSignOut()
                }),
                //                        .default(Text("DEFAULT BUTTON")),
                .cancel()
            ])
        }
        .fullScreenCover(isPresented: $vm.isUserCurrentlyLoggedOut, onDismiss: nil) {
            LoginScreenView(didCompleteLoginProgress: {
                self.vm.isUserCurrentlyLoggedOut = false
                self.vm.fetchCurrentUser()
            })
        }
    }
}



struct MainMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView()
    }
}
