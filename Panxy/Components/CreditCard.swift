//
//  CreditCard.swift
//  Panxy
//
//  Created by Samy Mehdid on 13/10/2022.
//

import SwiftUI

struct CreditCard: View {
    var body: some View {
        ZStack {
            VStack(spacing: 32){
                VStack{
                    Text("Total Balance")
                        .font(.custom("Rubik-Medium", size: 20))
                        .opacity(0.7)
                    Text("$ 4800.00")
                        .font(.custom("Rubik-Medium", size: 46))
                }
                HStack {
                    HStack(spacing: 8){
                        Image(systemName: "arrow.down")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.green)
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .frame(width: 52)
                            .cornerRadius(.infinity)
                        
                        VStack(alignment:.leading){
                            Text("Income")
                                .font(.custom("Rubik-Medium", size: 16))
                                .opacity(0.6)
                            Text("2500.00")
                                .font(.custom("Rubik-Medium", size: 22))
                        }
                    }
                    Spacer()
                    HStack{
                        Image(systemName: "arrow.up")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.red)
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .frame(width: 52)
                            .cornerRadius(.infinity)
                        
                        VStack(alignment: .leading){
                            Text("Expenses")
                                .font(.custom("Rubik-Medium", size: 16))
                                .opacity(0.6)
                            Text("800.00")
                                .font(.custom("Rubik-Medium", size: 22))
                        }
                    }
                }
            }
        }
        .padding()
        .padding(.vertical, 16)
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.23, green: 0.86, blue: 1), Color(red: 0.43, green: 0.23, blue: 1), Color(red: 0.95, green: 0.48, blue: 0.90), Color(red: 1, green: 0.72, blue: 0.30)]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
        .cornerRadius(32)
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard()
    }
}
