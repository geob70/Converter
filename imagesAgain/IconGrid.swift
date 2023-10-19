//
//  IconGrid.swift
//  imagesAgain
//
//  Created by Sylvester George on 18/10/2023.
//

import SwiftUI

struct IconGrid: View {
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: CurrencyModel
    
    var body: some View {
        LazyVGrid(columns: gridLayout, content: {
            ForEach(0..<5) { i in
                if CurrencyModel.allCases[i] == currency {
                    Currency(
                        currencyImage: CurrencyImage.allCases[i].rawValue,
                        currencyText: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3))
                        .shadow(color: .black, radius: 9)
                } else {
                    Currency(
                        currencyImage: CurrencyImage.allCases[i].rawValue,
                        currencyText: CurrencyText.allCases[i].rawValue)
                    .onTapGesture {
                        currency = CurrencyModel.allCases[i]
                    }
                }
                    
            }
        }).padding([.bottom, .leading, .trailing])    }
}

#Preview {
    IconGrid(currency: .constant(.SilverPiece))
}
