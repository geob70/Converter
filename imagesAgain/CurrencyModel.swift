//
//  CurrencyModel.swift
//  imagesAgain
//
//  Created by Sylvester George on 18/10/2023.
//

enum CurrencyModel: Double, CaseIterable {
    case CopperPenny = 640
    case SilverPenny = 64
    case SilverPiece = 16
    case GoldPenny = 4
    case GoldPiece = 1
    
    func convert(amount: String, currency: CurrencyModel) -> String {
        guard let startAmount = Double(amount) else {
            return ""
        }
        
        let convertedAmount = (startAmount / self.rawValue) * currency.rawValue
        return convertedAmount > 0 ? String(format: "%.2f", convertedAmount) : ""
    }
}

enum CurrencyText: String, CaseIterable {
    case CopperPenny = "Copper Penny"
    case SilverPenny = "Silver Penny"
    case SilverPiece = "Silver Piece"
    case GoldPenny = "Gold Penny"
    case GoldPiece = "Gold Piece"
}

enum CurrencyImage: String, CaseIterable {
    case CopperPenny = "copperpenny"
    case SilverPenny = "silverpenny"
    case SilverPiece = "silverpiece"
    case GoldPenny = "goldpenny"
    case GoldPiece = "goldpiece"
}
