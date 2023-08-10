//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by mido mj on 8/6/23.
//

import SwiftUI

 @main
struct ToDoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
           
        }
    }
}
