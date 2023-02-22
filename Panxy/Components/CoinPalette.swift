//
//  CoinPalette.swift
//  Panxy
//
//  Created by Samy Mehdid on 30/10/2022.
//

import SwiftUI

enum Coin: String, CaseIterable {
    case Bitcoin
    case Etherium
    case Dogecoin
    case Litecoin
    case Solana
    case USDT
    case Terra
    case Shiba
    
    var marketChange: Double {
        switch self {
        case .Bitcoin:
            return +5.24
        case .Etherium:
            return -1.7
        case .Dogecoin:
            return -2.4
        case .Litecoin:
            return -3.7
        case .Solana:
            return +3.14
        case .USDT:
            return 0
        case .Terra:
            return -12
        case .Shiba:
            return -1.3
        }
    }
    
    var portfolioHold: UInt {
        switch self {
        case .Bitcoin:
            return 13
        case .Etherium:
            return 25
        case .Dogecoin:
            return 12
        case .Litecoin:
            return 9
        case .Solana:
            return 29
        case .USDT:
            return 6
        case .Terra:
            return 3
        case .Shiba:
            return 3
        }
    }
    
    var abr: String {
        switch self {
        case .Bitcoin:
            return "BTC"
        case .Etherium:
            return "ETH"
        case .Dogecoin:
            return "DOGE"
        case .Litecoin:
            return "LTC"
        case .Solana:
            return "SOL"
        case .USDT:
            return "USDT"
        case .Terra:
            return "LUNA"
        case .Shiba:
            return "SHIB"
        }
    }
    
    func marketColor(marketChange value: Double) -> Color {
        if value >= 0 {
            return .green
        } else {
            return .accentColor
        }
    }
}

extension Coin: Identifiable {
    var id: UUID { UUID() }
}

struct CoinPalette: View {
    @State var coin: Coin
    
    var body: some View {
        HStack {
            ZStack{
                Image(coin.rawValue)
                    .resizable()
                    .padding(8)
            }
            .background(Color.white.opacity(0.5))
            .frame(width: 56, height: 56)
            .cornerRadius(16)
            VStack(alignment: .leading){
                Text(coin.rawValue)
                    .font(.custom("Rubik-Medium", size: 18))
                Text("\(coin.portfolioHold)% of portfolio")
                    .font(.custom("Rubik-Medium", size: 14))
                    .opacity(0.6)
            }
            Spacer()
            VStack {
                Text(coin.abr)
                    .font(.custom("Rubik-SemiBold", size: 14))
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(14)
                
                Text("\(String(format: "%.2f", coin.marketChange))%")
                    .font(.custom("Rubik-Medium", size: 16))
                    .foregroundColor(coin.marketColor(marketChange: coin.marketChange))
            }
            
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(16)
    }
}

struct CoinPalette_Previews: PreviewProvider {
    static var previews: some View {
        CoinPalette(coin: .Litecoin)
            .background(Color.black)
    }
}
