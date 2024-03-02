//
//  ListRowView.swift
//  ToDoList
//
//  Created by mustafa eray Pişkin on 18.02.2024.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        
        HStack{
            
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .gray)
                
            Text(item.title.capitalized)
            Spacer()
            
        }
        .font(.title3)
        .padding(5)
    }
}

struct ListRowView_Previews : PreviewProvider {
    
    static var item1 = ItemModel(title: "first item", isCompleted: true)
    static var item2 = ItemModel(title: "second item", isCompleted: false)
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
            
        }
        
    }
}
