//
//  CardOnboarding.swift
//  Panxy
//
//  Created by Samy Mehdid on 30/10/2022.
//

import SwiftUI

struct CardOnboarding: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CardOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

enum CardType {
    case crystal
    case colorful
    
    var background: LinearGradient {
        switch self {
        case .crystal:
            return LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.4), Color.white.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        case .colorful:
            return LinearGradient(gradient: Gradient(colors: [Color("Green"), Color("backgroundTabbar")]), startPoint: .topTrailing, endPoint: .bottomLeading)
        }
    }
}

struct Card: View {
    var card: CardType
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 24){
                HStack{
                    Image("mastercard")
                        .resizable()
                        .frame(width: 42, height: 38)
                    Spacer()
                    Image(systemName: "wave.3.right")
                        .resizable()
                        .frame(width: 28, height: 32)
                }
                VStack(alignment: .leading, spacing: 12){
                    Text("Credit card number")
                        .font(.custom("Rubik-Medium", size: 22))
                        .opacity(0.7)
                    Text("4378 4324 0911 2381")
                        .font(.custom("Rubik-Medium", size: 32))
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("Name")
                            .font(.custom("Rubik-Medium", size: 18))
                            .opacity(0.7)
                        Text("William Smith")
                            .font(.custom("Rubik-Medium", size: 22))
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Exp. Date")
                            .font(.custom("Rubik-Medium", size: 18))
                            .opacity(0.7)
                        Text("10/26")
                            .font(.custom("Rubik-Medium", size: 22))
                    }
                    Spacer()
                    Image(systemName: "esim.fill")
                        .resizable()
                        .frame(width: 36, height: 32)
                }
            }
            .padding()
        }
        .background(card.background)
        .background(.ultraThinMaterial)
        .overlay{
            RoundedRectangle(cornerRadius: 24)
                .stroke(.white, style: StrokeStyle(lineWidth: 2))
        }
        .cornerRadius(24)
        .foregroundColor(.white)
    }
}
