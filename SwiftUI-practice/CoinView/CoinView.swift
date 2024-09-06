//
//  CoinView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/4/24.
//

import SwiftUI

struct CoinView: View {
    
    @State private var market: Markets = []
    @State private var searchText = ""
    
    // var filteredMarket: Markets {
    //     return searchText.isEmpty ? market : market.filter { $0.koreanName.contains(searchText) || $0.englishName.contains(searchText) }
    // }
    
    @State private var filteredMarket: Markets = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                bannerView()
                listView()
            }
            .searchable(text: $searchText)
            .onSubmit(of: .search) {  /// 엔터키 탭 -> 검색 결과 반영
                filteredMarket = searchText.isEmpty ? market : filteredMarket.filter { $0.koreanName.contains(searchText) || $0.englishName.contains(searchText) }
            }
            .navigationTitle("My Money")
            .refreshable {
                market = market.shuffled()
            }
        }
        .task {
            do {
                let data = try await UpbitAPI.fetchAllMarket()
                market = data
                filteredMarket = market
            } catch {
                print(error)
            }
        }
    }
    
    private func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.purple)
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(.white.opacity(0.2))
                        .scaleEffect(2)
                        .offset(x: -55)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(height: 150)
                .padding()
            VStack(alignment: .leading) {
                Spacer()
                Text(market.randomElement()?.market ?? "")
                    .font(.callout)
                    .bold()
                Text(market.randomElement()?.koreanName ?? "")
                    .font(.title)
                    .bold()
            }
            .foregroundStyle(.white)
            .padding(40)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func listView() -> some View {
        LazyVStack {
            ForEach($filteredMarket, id: \.id) { $item in
                NavigationLink {
                    CoinDetailView(market: $item)
                } label: {
                    // rowView(item)
                    RowView(item: $item)
                }
            }
        }
        
    }
    
    private func rowView(_ item: Market) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.koreanName)
                    .fontWeight(.bold)
                Text(item.englishName)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
            }
            Spacer()
            // Text(item.market)
            Button(action: {
                
            }, label: {
                Image(systemName: item.isLike ? "heart.fill" : "heart")
            })
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .foregroundStyle(.black)
    }
    
}

struct RowView: View {
    
    @Binding var item: Market
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.koreanName)
                    .fontWeight(.bold)
                Text(item.englishName)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
            }
            Spacer()
            // Text(item.market)
            Button(action: {
                item.isLike.toggle()
            }, label: {
                Image(systemName: item.isLike ? "heart.fill" : "heart")
            })
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .foregroundStyle(.black)
    }
    
}

#Preview {
    CoinView()
}
