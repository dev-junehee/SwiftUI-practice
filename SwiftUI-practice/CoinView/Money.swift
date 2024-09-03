//
//  Money.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/4/24.
//

import Foundation

struct Money: Identifiable {
    
    enum Category: String {
        case study = "자기계발"
        case food = "식비"
        case house = "정기지출"
        case hobby = "취미"
        case deposit = "저축"
    }
    
    let id = UUID()
    let amount: Int
    let product: String
    let category: Category
    
    var amountFormat: String {
        return String(amount.formatted()) + "원"
    }
    
}
