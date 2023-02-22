//
//  Adding.swift
//  Panxy
//
//  Created by Samy Mehdid on 30/10/2022.
//

import SwiftUI

class Adding: ObservableObject {
    
    @Published var cardNumber: String = "" {
        didSet {
            if cardNumber.count > maxCard && oldValue.count <= maxCard {
                cardNumber = oldValue
            }
        }
    }
    
    @Published var experationMonth: String = "" {
        didSet {
            if experationMonth.count > maxMnth && oldValue.count <= maxMnth {
                experationMonth = oldValue
            }
        }
    }
    
    @Published var experationYear: String = "" {
        didSet {
            if experationYear.count > maxYear && oldValue.count <= maxYear {
                experationYear = oldValue
            }
        }
    }
    
    @Published var ccv: String = "" {
        didSet {
            if ccv.count > maxCCV && oldValue.count <= maxCCV {
                ccv = oldValue
            }
        }
    }
    
    let maxCard: Int = 16
    let maxMnth: Int = 2
    let maxYear: Int = 4
    let maxCCV: Int = 3
    
}
