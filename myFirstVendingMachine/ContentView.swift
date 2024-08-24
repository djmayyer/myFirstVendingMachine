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
    // Sample vending machine items
    let items = [
        VendingItem(name: "Coca Cola", price: 1.50),
        VendingItem(name: "Chips Lays", price: 1.00),
        VendingItem(name: "Snickers", price: 0.75),
        VendingItem(name: "Water", price: 1.25),
        VendingItem(name: "Sprite", price: 1.50)
    ]
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to the Vending Machine!")
                .font(.title)
                .padding()
            
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
        .padding()
    }
}

#Preview {
    ContentView()
}
