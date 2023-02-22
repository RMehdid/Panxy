//
//  Requesting.swift
//  Panxy
//
//  Created by Samy Mehdid on 30/10/2022.
//

import Foundation

class Requesting: ObservableObject {
    @Published var requestFromID: String = ""
    @Published var amount: String = ""
}
