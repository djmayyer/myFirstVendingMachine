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
            //Globe image
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            //H1 Title of the app
            Text("My First Vending Machine")
                .font(.title)
                .padding()
            /*
             Balance Display
             */
            Text("Balance: $\(userBalance, specifier: "%.2f")")
                .font(.headline)
                .padding(.bottom, 10)
            
            List(items) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text("$\(item.price, specifier: "%.2f")")
                    Button(action: {
                        // Handle purchase action
                        print("Purchased \(item.name) for $\(item.price)")
                        userPurchase(item: item)
                    }) {
                        Text("Buy")
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                    .disabled(userBalance < item.price)
                }
                .padding(.vertical, 5)
            }
            
            if !userPromtMessage.isEmpty {
                Text(userPromtMessage)
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }
        }
        TabView{
            ViewA()
                .tabItem(){
                    Image(systemName: "pencil")
                    Text("Settings")
                }
            ViewB()
            .tabItem(){
                Image(systemName: "phone.fill")
                Text("Calls")
            }
            ViewC()
            .tabItem(){
                Image(systemName: "globe")
                Text("World")
            }
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
