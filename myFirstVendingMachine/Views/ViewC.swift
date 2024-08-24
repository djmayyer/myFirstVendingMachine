//
//  ViewC.swift
//  myFirstVendingMachine
//
//  Created by Vlad Gabriel on 24.08.2024.
//
import SwiftUI

struct ViewC: View{
    var body: some View{
        ZStack{
            Color.green
            
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
        }
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View{
        ViewC()
    }
}
