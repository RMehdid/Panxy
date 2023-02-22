//
//  Home.swift
//  Panxy
//
//  Created by Samy Mehdid on 13/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var operation: Operation = .none
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            MainCard(operating: $operation)
                .edgesIgnoringSafeArea(.all)
                .shadow(radius: 20)
            VStack(alignment: .leading){
                Text("Portfolio")
                    .font(.custom("Rubik-Medium", size: 28))
                    .foregroundColor(.white)
                ScrollView(showsIndicators: false){
                    ForEach(Coin.allCases){ coin in
                        NavigationLink {
                            CoinPage(coin: coin)
                        } label: {
                            CoinPalette(coin: coin)
                        }
                    }
                }
                .simultaneousGesture(
                    DragGesture()
                        .onChanged{ value in
                            if value.translation.height < -10 {
                                withAnimation {
                                    operation = .empty
                                }
                            } else if value.translation.height > 10 {
                                withAnimation {
                                    operation = .none
                                }
                            }
                        }
                )
            }
            .padding(.horizontal)
        }
        .background(Color("Background"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
