//
//  PanxyApp.swift
//  Panxy
//
//  Created by Samy Mehdid on 13/10/2022.
//

import SwiftUI

@main
struct PanxyApp: App {
    
    @AppStorage("Onboarding") var beenOnboarded: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if beenOnboarded {
                    Wrapper()
                } else {
                    Onboarding()
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }
    }
}
