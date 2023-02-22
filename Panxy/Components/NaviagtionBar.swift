//
//  NaviagtionBar.swift
//  Panxy
//
//  Created by Samy Mehdid on 13/10/2022.
//

import SwiftUI

struct NaviagtionBar: View {
    var body: some View {
        HStack{
            HStack(spacing: 8){
                Image("profile-placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42)
                    .cornerRadius(.infinity)
                VStack(alignment: .leading){
                    Text("Welcome!")
                        .font(.custom("Rubik-Medium", size: 16))
                        .foregroundColor(.gray)
                    Text("Samy Mehdid")
                        .font(.custom("Rubik-Medium", size: 18))
                }
            }
            Spacer()
            Button {
                //
            } label: {
                Image(systemName: "circle.hexagonpath.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32)
            }
            .foregroundColor(.gray)
        }
    }
}

struct NaviagtionBar_Previews: PreviewProvider {
    static var previews: some View {
        NaviagtionBar()
    }
}
