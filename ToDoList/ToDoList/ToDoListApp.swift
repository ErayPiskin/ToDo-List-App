//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by mustafa eray Pişkin on 18.02.2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
