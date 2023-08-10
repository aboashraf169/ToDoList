//
//  ListViewModel.swift
//  ToDoList
//
//  Created by mido mj on 8/6/23.
//

import Foundation
class ListViewModel : ObservableObject{
    @Published var items: [ItemModel] = []{
        didSet{
            SaveItems()
        }
    }
    let itemsKey: String = "items_List"
    
    init() {getItems() }
    
    func getItems(){
        guard
            let data = UserDefaults().data(forKey: itemsKey)
           ,let SaveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = SaveItems
 
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func MoveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func AddItem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item : ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func SaveItems() {
        if let encodedData = try? JSONEncoder ().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
