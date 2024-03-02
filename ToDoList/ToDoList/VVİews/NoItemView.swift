//
//  NoItemView.swift
//  ToDoList
//
//  Created by mustafa eray Pişkin on 19.02.2024.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate : Bool = false
    let secondaryAccentColor = Color("SecondAccentColor")
    
    var body: some View {
            ScrollView{
                VStack(spacing : 10){
                    Text("There are no items!")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("Are you a productive person? I think you should click the add button and add a bunch of items to your Todo list! ")
                        .padding(.bottom,20)
                    
                    NavigationLink(
                        destination: AddItem(),
                        label: {
                        Text("Add something")
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .font(.headline)
                            .cornerRadius(10)
                            
                    })
                    .padding(.horizontal, animate ? 20 : 50)
                    .shadow(
                        color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                        x: 4,
                        y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -10 : 0)
                }
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimations)
            }
            .frame(maxWidth: .infinity, maxHeight : .infinity )
    }
    
    func addAnimations(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
                
            ) {
                animate.toggle()
            }
        }
        
    }
    
}

#Preview {
    NoItemView()
}
