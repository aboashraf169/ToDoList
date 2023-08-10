//
//  AddView.swift
//  ToDoList
//
//  Created by mido mj on 8/6/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFiledText: String = ""
    @State var AlertTitle: String = ""
    @State var ShowAlert:  Bool = false
    var body: some View {
        ScrollView  {
            VStack {
                
                TextField( "Type something here....", text: $textFiledText)
                    .padding(.horizontal )
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.top,20)
                .padding(.bottom,20)
                Button {
                    if textIsAppropiate() {
                        SaveButtonPressed()
                        presentationMode.wrappedValue.dismiss()
                    }
                
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️ ")
        .alert(isPresented: $ShowAlert) {
             getAlart()
        }
         
    }
    
    func SaveButtonPressed(){
        if textIsAppropiate() {
        listViewModel.AddItem(title: textFiledText)
        }
    }
    func textIsAppropiate() -> Bool{
        if textFiledText.count <  3 {
            AlertTitle =  "you new todo must be at least 3 characters long!!!!😰😨😱"
            ShowAlert.toggle()
            return false
        }
        return true

    }
    func getAlart () -> Alert{
        return Alert(title: Text(AlertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
            NavigationView{
                AddView()
            }.environmentObject(ListViewModel())
    }
}
 
