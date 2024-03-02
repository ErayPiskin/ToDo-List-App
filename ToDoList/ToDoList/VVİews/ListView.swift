//
//  ListView.swift
//  ToDoList
//
//  Created by mustafa eray Pişkin on 18.02.2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {

        ZStack{
            if listViewModel.items.isEmpty {
                NoItemView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation{
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItems)
                }
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add"){
                    AddItem()
                }
            }
        }
    }
    
    
    
}

struct ListView_Previews : PreviewProvider {
    static var previews: some View{
        NavigationStack{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


