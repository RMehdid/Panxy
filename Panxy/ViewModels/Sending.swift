//
//  Sending.swift
//  Panxy
//
//  Created by Samy Mehdid on 30/10/2022.
//

import Foundation

class Sending: ObservableObject {
    @Published var destinationID: String = ""
    @Published var amount: String = ""
}
