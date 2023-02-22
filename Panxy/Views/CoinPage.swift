//
//  CoinPage.swift
//  Panxy
//
//  Created by Samy Mehdid on 30/10/2022.
//

import SwiftUI

struct CoinPage: View {
    let coin: Coin
    var body: some View {
        Text(coin.rawValue)
    }
}

struct CoinPage_Previews: PreviewProvider {
    static var previews: some View {
        CoinPage(coin: .Etherium)
    }
}
