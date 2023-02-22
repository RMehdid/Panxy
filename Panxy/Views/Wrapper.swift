//
//  Wrapper.swift
//  Panxy
//
//  Created by Samy Mehdid on 13/10/2022.
//

import SwiftUI
import TabBar



struct Wrapper: View {
    
    @State var selection: TabbarItem = .home
    @State var tbVisibility: TabBarVisibility = .visible
    
    var body: some View {
        TabBar(selection: $selection, visibility: $tbVisibility) {
            ForEach(TabbarItem.allCases){ item in
                item.screen
                    .tabItem(for: item)
            }
        }
        .tabItem(style: CustomTabItemStyle())
        .tabBar(style: CustomTabBarStyle())
        .shadow(radius: 20)
        .navigationBarHidden(true)
    }
}

struct Wrapper_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
    }
}
