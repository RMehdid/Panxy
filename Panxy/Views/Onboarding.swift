//
//  Onboarding.swift
//  Panxy
//
//  Created by Samy Mehdid on 30/10/2022.
//

import SwiftUI

struct Onboarding: View {
    @State private var onboardingProgress: Double = 0.0
    @State private var success: Double = 100.0
    @State private var page = 0
    
    @AppStorage("onboarding") var beenOnboarded: Bool = false
    
    func onboarded(onboardingProgress newValue: Double) {
        beenOnboarded = newValue == success
    }
    
    var body: some View {
        ZStack(alignment: .top){
            if page == 0 {
                ZStack{
                    Card(card: .colorful)
                        .padding(30)
                        .rotationEffect(Angle(degrees: 20))
                        .offset(CGSize(width: 0, height: 50))
                
                    Card(card: .crystal)
                        .padding(30)
                        .rotationEffect(Angle(degrees: -10))
                        .offset(CGSize(width: 0, height: 200))
                }
            } else if page == 1 {
                ZStack{
                    VStack(spacing: 50){
                        Image("Bitcoin")
                            .resizable()
                            .frame(width: 118, height: 118)
                            .offset(x: -70)
                        HStack{
                            Image("Solana")
                                .resizable()
                                .frame(width: 130, height: 130)
                                .offset(y: 40)
                            Image("Etherium")
                                .resizable()
                                .frame(width: 170, height: 150)
                                .offset(x: 30, y: -60)
                        }
                    }
                    .offset(y: 100)
                }
                .shadow(radius: 50)
            } else {
                ZStack{
                    Image("onboardingChart")
                        .resizable()
                        .frame(width: 400, height: 430)
                        .opacity(0.9)
                        .offset(y: 30)
                }
            }
            
            VStack(spacing: 50){
                NavigationLink(destination: Wrapper(), isActive: $beenOnboarded) { EmptyView() }
                Spacer()
                VStack(spacing: 18){
                    if page == 0{
                        Text("Your own money")
                            .font(.custom("Rubik-SemiBold", size: 32))
                        Text("have control over your own money, see where it goes.")
                            .font(.custom("Rubik-Medium", size: 20))
                            .frame(maxWidth: 350)
                    } else if page == 1 {
                        Text("The Future")
                            .font(.custom("Rubik-SemiBold", size: 32))
                        Text("learn more about cryptocurrencies, look to the future")
                            .font(.custom("Rubik-Medium", size: 20))
                            .frame(maxWidth: 350)
                    } else {
                        Text("Bigger Picture")
                            .font(.custom("Rubik-SemiBold", size: 32))
                        Text("Luckier you are to gain more when you see the bigger picture.")
                            .font(.custom("Rubik-Medium", size: 20))
                            .frame(maxWidth: 350)
                    }
                }
                .foregroundColor(.white)
                Image("Send")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .rotationEffect(Angle(degrees: 90))
                    .foregroundColor(.white)
                    .padding(24)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Ceal"), Color.accentColor]), startPoint: .bottomLeading, endPoint: .topTrailing).cornerRadius(.infinity))
                    .padding(8)
                    .overlay {
                        Circle()
                            .trim(from: 0, to: onboardingProgress/success)
                            .stroke(.green, style: StrokeStyle(lineWidth: 6))
                            .rotationEffect(Angle(degrees: -90))
                    }
                    .onTapGesture {
                        withAnimation {
                            onboardingProgress += success / 3
                            if page != 2 {
                                page += 1
                            }
                        }
                    }
            }
        }
        .padding(.bottom, 38)
        .frame(width: UIScreen.main.bounds.width)
        .onChange(of: onboardingProgress) { newValue in
            onboarded(onboardingProgress: newValue)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("Onboarding"), Color("Background")]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    @ViewBuilder
    func GlassMorphicCard() -> some View {
        ZStack {
            CustomBlurView(effect: .systemUltraThinMaterialDark) { view in
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        }
    }
}
struct CustomBlurView: UIViewRepresentable {
    var effect: UIBlurEffect.Style
    var onChange: (UIVisualEffectView)->()
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        DispatchQueue.main.async {
            onChange(uiView)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
