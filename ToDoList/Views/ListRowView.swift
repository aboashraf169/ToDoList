//
//  ListRowView.swift
//  ToDoList
//
//  Created by mido mj on 8/6/23.
//

import SwiftUI
struct ListRowView: View {
    var item: ItemModel
 
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 8)
        
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var itemOne = ItemModel(title: "the is a First Item",isCompleted: true)

    static var itemTwo = ItemModel(title: "the is a Secand Item",isCompleted: false)

    static var previews: some View {
        Group{
            ListRowView(item: itemOne)
            ListRowView(item: itemTwo)

        }.previewLayout(.sizeThatFits)
    }
}
