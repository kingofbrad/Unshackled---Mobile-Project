
import SwiftUI

struct JournalAddEntriyView: View {
    @StateObject var viewModel = EntryViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Journal Title"))
                {TextField("Title", text: $viewModel.entry.title)}
                
                Section(header: Text("Text"))
                {TextEditor(text: $viewModel.entry.text)
                    
                }
            }
            .navigationBarTitle("New Entry", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {handleCancelTapped()} ,
                trailing: Button("Save") {handleSaveTapped()}
                    .disabled(!viewModel.modified)
            )
        }
    }
    
    func handleCancelTapped() {
        dismiss()
    }
    
    func handleSaveTapped() {
        viewModel.save()
        dismiss()
    }
    
}
struct JournalAddEntriyView_Previews: PreviewProvider {
    static var previews: some View {
        JournalAddEntriyView()
    }
}
