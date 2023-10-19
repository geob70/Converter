//
//  ExchangeInfo.swift
//  imagesAgain
//
//  Created by Sylvester George on 18/10/2023.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Background
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .background(.brown)
            
            VStack {
                // Title text
                Text("Exchange rate")
                    .font(.largeTitle)
                
                // Body text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                // Exchange rates
                ExchangeRate(leftImage: "goldpenny", text: "String", rightImage: "silverpiece")
                ExchangeRate(leftImage: "goldpenny", text: "String", rightImage: "silverpiece")
                ExchangeRate(leftImage: "goldpenny", text: "String", rightImage: "silverpiece")
                ExchangeRate(leftImage: "goldpenny", text: "String", rightImage: "silverpiece")
                
                // DOne button
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
            .foregroundColor(.black)
            
        }
    }
}

struct Exchange_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
            .preferredColorScheme(.dark)
    }
}
