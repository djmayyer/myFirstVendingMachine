//
//  ViewB.swift
//  myFirstVendingMachine
//
//  Created by Vlad Gabriel on 24.08.2024.
//
import SwiftUI

struct ViewSnacks: View{
    let items = [
        VendingItem(name: "Coca Cola", price: 1.50),
        VendingItem(name: "Snickers", price: 0.75),
        VendingItem(name: "Chips Lays", price: 1.00)
    ]
    
    var body: some View{
        ZStack{
            Color.green
            
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
            
            List(items) { item in
               HStack {
                   Text(item.name)
                   Spacer()
                   Text("$\(item.price, specifier: "%.2f")")
                   Button(action: {
                       // Handle purchase action
                       print("Purchased \(item.name) for $\(item.price)")
                   }) {
                       Text("Buy")
                           .foregroundColor(.white)
                           .padding(.vertical, 5)
                           .padding(.horizontal, 10)
                           .background(Color.blue)
                           .cornerRadius(5)
                   }
               }
               .padding(.vertical, 5)
           }
        }
    }
}

struct ViewSnacks_Previews: PreviewProvider {
    static var previews: some View{
        ViewSnacks()
    }
}
