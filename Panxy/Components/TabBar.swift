//
//  TabBar.swift
//  Panxy
//
//  Created by Samy Mehdid on 13/10/2022.
//

import SwiftUI
import TabBar

enum TabbarItem: Int, CaseIterable, Identifiable, Tabbable {
    var id: UUID { UUID() }
    
    case home = 0
    case overView
    case wallet
    case settings
    
    var icon: String {
        switch self {
        case .home:
            return "homeIcon"
        case .overView:
            return "overViewIcon"
        case .wallet:
            return "walletIcon"
        case .settings:
            return "settingsIcon"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "home"
        case .overView:
            return "overview"
        case .wallet:
            return "wallet"
        case .settings:
            return "settings"
        }
    }
    
    var screen: AnyView {
        switch self {
        case .home:
            return AnyView(HomeView())
        case .overView:
            return AnyView(Overview())
        case .wallet:
            return AnyView(Wallet())
        case .settings:
            return AnyView(Settings())
        }
    }
}

struct CustomTabBarStyle: TabBarStyle {

    func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
            itemsContainer()
            .background(Color("backgroundTabbar"))
            .cornerRadius(18)
    }
}

struct CustomTabItemStyle: TabItemStyle {
    func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        VStack(spacing: 12){
                Rectangle()
                    .frame(height: 7)
                    .cornerRadius(7)
                    .padding(.horizontal, 28)
                    .foregroundColor(.accentColor)
                    .opacity(isSelected ? 1 : 0)
            VStack(spacing: 5){
                Image(icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(title)
                    .font(.custom("Rubik-Medium", size: 15))
            }
            .opacity(isSelected ? 1 : 0.7)
        }
        .padding(.bottom, 24)
        .foregroundColor(.white)
    }
}
