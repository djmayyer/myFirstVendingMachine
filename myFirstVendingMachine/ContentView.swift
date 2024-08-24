//
//  ContentView.swift
//  myFirstVendingMachine
//
//  Created by Horia Zamfir on 24.08.2024.
//

import SwiftUI

struct VendingItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
}

struct ContentView: View {
    /*
     Vending Machine Item List
     */
    let items = [
        VendingItem(name: "Coca Cola", price: 1.50),
        VendingItem(name: "Chips Lays", price: 1.00),
        VendingItem(name: "Snickers", price: 0.75),
        VendingItem(name: "Water", price: 1.25),
        VendingItem(name: "Sprite", price: 1.50)
    ]
    /*
     User Balance
     */
    @State private var userBalance: Double = 10.00
    @State private var userPromtMessage: String = ""
    var body: some View {
       
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to the Vending Machine!")
                .font(.title)
                .padding()
            TabView{
                ViewDrinks()
                    .tabItem(){
                        Image(systemName: "cup.and.saucer.fill")
                        Text("Drinks")
                    }
                ViewSnacks()
                .tabItem(){
                    Image(systemName: "fork.knife")
                    Text("Snacks")
                }
                ViewSweets()
                .tabItem(){
                    Image(systemName: "birthday.cake")
                    Text("Sweets")
                }
            }
//            List(items) { item in
//                HStack {
//                    Text(item.name)
//                    Spacer()
//                    Text("$\(item.price, specifier: "%.2f")")
//                    Button(action: {
//                        // Handle purchase action
//                        print("Purchased \(item.name) for $\(item.price)")
//                    }) {
//                        Text("Buy")
//                            .foregroundColor(.white)
//                            .padding(.vertical, 5)
//                            .padding(.horizontal, 10)
//                            .background(Color.blue)
//                            .cornerRadius(5)
//                    }
//                }
//                .padding(.vertical, 5)
//            }
        }
        
        .padding()
    }
    
    /*
     Function for handling the item purchase
     */
    func userPurchase(item: VendingItem){
        if userBalance >= item.price {
            userBalance -= item.price
            userPromtMessage = "Purchased \(item.name) for $\(item.price)"
        } else {
            userPromtMessage = "Insufficient funds for \(item.name)"
        }
    }
}
#Preview {
    ContentView()
}
