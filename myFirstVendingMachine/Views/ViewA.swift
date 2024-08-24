//
//  ViewA.swift
//  myFirstVendingMachine
//
//  Created by Vlad Gabriel on 24.08.2024.
//
import SwiftUI

struct ViewA: View{
    var body: some View{
        ZStack{
            Color.cyan
            
            Image(systemName: "globe")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
        }
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View{
        ViewA()
    }
}
