//
//  AddItem.swift
//  ToDoList
//
//  Created by mustafa eray Pişkin on 18.02.2024.
//

import SwiftUI

struct AddItem: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText : String = ""
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type here", text: $textFieldText)
                    .padding(20)
                    .frame(height: 55)
                    .background(.ultraThickMaterial)
                    .cornerRadius(20)
                    .padding(10)
                
                Button {saveButton()
                } label: {
                    Text("save".uppercased())
                        .foregroundStyle(.white)
                        .padding(.horizontal,20)
                        .padding()
                        .background(Color.accentColor)
                        .font(.headline)
                        .frame(height: 55)
                        .cornerRadius(20)
                }

                
            }
        }
        .navigationTitle("Add Item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButton(){
        if isTextAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        

    }
    
    func isTextAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new Todo item must be at least 3 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddItem_Previews : PreviewProvider {
    static var previews: some View{
        NavigationStack{
            AddItem()
        }
        .environmentObject(ListViewModel())
        
    }
}
