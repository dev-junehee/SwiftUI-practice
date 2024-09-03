//
//  CoinDetailView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/4/24.
//

import SwiftUI

struct CoinDetailView: View {
    let market: Market
    
    var body: some View {
        Text(market.market)
        Text(market.koreanName)
        Text(market.englishName)
    }
}

#Preview {
    CoinDetailView(market: Market(market: "1", koreanName: "2", englishName: "3"))
}
