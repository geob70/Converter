//
//  Currency.swift
//  imagesAgain
//
//  Created by Sylvester George on 18/10/2023.
//

import SwiftUI

struct Currency: View {
    @State var currencyImage: String
    @State var currencyText: String
    
    var body: some View {
        ZStack {
            // image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            // text
            VStack {
                Spacer()
                
                Text(currencyText)
                    .padding(3)
                    .font(.caption)
                .background(.brown.opacity(0.75))
            }
        }
        .padding(3)
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

struct Currency_Previews: PreviewProvider {
    static var previews: some View {
        Currency(currencyImage: "copperpenny", currencyText: "Copper penny")
            .previewLayout(.sizeThatFits)
    }
}
