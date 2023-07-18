import SwiftUI




struct SignUpView: View {
    @State private var SignUpVM = SignUpViewModal()
    @State private var isSecured: Bool = true
    
    
    @State private var toLoginView: Bool = false
    
    @State private var appContext = AppContext()
    
    
    var body: some View {
        if !appContext.appUnlocked {
           
        } else {
            HomeView()
        }
    }
    
  
    
    
    
    
    
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
    
}






