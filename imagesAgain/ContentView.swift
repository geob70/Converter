//
//  ContentView.swift
//  imagesAgain
//
//  Created by Sylvester George on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var silverPiece = ""
    @State var goldPiece = ""

    
    @State var silverPieceTemp = ""
    @State var goldPieceTemp = ""
    
    @State var leftTyping = false
    @State var rightTyping = false


    @State var leftCurrency: CurrencyModel = .SilverPiece
    @State var rightCurrency: CurrencyModel = .GoldPiece
    
    @State var showSelectCurrencyView = false;
    @State var showExchangeCurrencyView = false;
    
    var body: some View {
        ZStack {
            // Background image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                 // Pricing pony image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                // Currency conversion section
                HStack {
                    // Left section
                    VStack {
                        // Currency
                        HStack {
                            //Currenvy image
                            Image(CurrencyImage.allCases[CurrencyModel.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency text
                            Text(CurrencyText.allCases[CurrencyModel.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrencyView.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrencyView, content: {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        
                        
                        // Text Field
                        TextField("Amount", text: $silverPiece, onEditingChanged: { isTyping in
                            leftTyping = isTyping
                            silverPieceTemp = silverPiece
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTyping ? silverPiece : silverPieceTemp) { oldValue, newValue in
                                goldPiece = leftCurrency.convert(amount: silverPiece, currency: rightCurrency)
                            }
                            .onChange(of: leftCurrency) { oldValue, newValue  in
                                silverPiece = rightCurrency.convert(amount: goldPiece, currency: leftCurrency)
                            }
                    }
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    // Right section
                    VStack {
                        // Currency
                        HStack {
                            // Currency text
                            Text(CurrencyText.allCases[CurrencyModel.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            //Currenvy image
                            Image(CurrencyImage.allCases[CurrencyModel.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrencyView.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrencyView, content: {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        // Text Field
                        TextField("Amount", text: $goldPiece, onEditingChanged:  { isTyping in
                            rightTyping = isTyping
                            goldPieceTemp = goldPiece
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? goldPiece : goldPieceTemp) { oldValue, newValue in
                                silverPiece = rightCurrency.convert(amount: goldPiece, currency: leftCurrency)
                            }
                            .onChange(of: rightCurrency) { oldValue, newValue  in
                                goldPiece = leftCurrency.convert(amount: silverPiece, currency: rightCurrency)
                            }

                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                
                // spacer and button
                HStack {
                    Spacer()
                    
                    // Info button
                    Button {
                        // Display exchange info screen
                        showExchangeCurrencyView.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.trailing)
                            .sheet(isPresented: $showExchangeCurrencyView, content: {
                                ExchangeInfo()
                            })
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
