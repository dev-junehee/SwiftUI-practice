//
//  CoinDetailView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/4/24.
//

import SwiftUI

struct CoinDetailView: View {
    
    @Binding var market: Market
    
    var body: some View {
        NavigationWrapper {
            Text(market.market)
            Text(market.koreanName)
            Text(market.englishName)
        }
        .navigationBar {
            /// leading
            Button(action: {
                
            }, label: {
                
            })
        } trailing: {   /// trailing
            Button(action: {
                market.isLike.toggle()
            }, label: {
                Image(systemName: market.isLike ? "heart.fill" : "heart")
            })
        }

    }
}

