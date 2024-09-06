//
//  Market.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/4/24.
//

import Foundation

struct Market: Hashable, Codable {
    let id = UUID()
    var market, koreanName, englishName: String
    var isLike = false

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}

