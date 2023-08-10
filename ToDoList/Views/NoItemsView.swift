 //
//  NoItemsView.swift
//  ToDoList
//
//  Created by mido mj on 8/7/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var  animate : Bool = false
    var SecanderyAccentColor = Color("SecanderyAccentColor")
    var body: some View {
        ScrollView  {
            
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom,20)
                Text("Are you a productive Person? I think you should click the add button and add bunch of items to your todo list!")
                    .padding(.bottom,20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? SecanderyAccentColor: Color.accentColor)
                        .cornerRadius(10)
                        
                }
                .padding(.horizontal,animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color:animate ? SecanderyAccentColor .opacity(0.7)
                   :Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0.0,
                    y: animate ? 50 : 30)

            }   .frame(maxWidth: 400)
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    func addAnimation()  {
        guard !animate else {  return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            
            ){
                animate.toggle()
            }
        }
    }
}
 
struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
                .navigationTitle("Title")
        }
        
    }
}
