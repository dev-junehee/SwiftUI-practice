//
//  CardAnimationView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/2/24.
//

import SwiftUI

struct CardModel: Hashable, Identifiable {
    let id = UUID()
    let color = Color(red: .random(in: 0...1),
                      green: .random(in: 0...1),
                      blue: .random(in: 0...1))
    let name: String
    let index: CGFloat
}

struct BasicAnimationView: View {
    
    @State private var showAnimation = false
    
    let list = [
        CardModel(name: "국민카드", index: 0),
        CardModel(name: "현대카드", index: 1),
        CardModel(name: "신한카드", index: 2),
        CardModel(name: "카카오뱅크카드", index: 3),
        CardModel(name: "우리카드", index: 4),
        CardModel(name: "롯데카드", index: 5),
    ]
    
    var body: some View {
        topTitle()
        cardContainer()
        
        // Button("Animation ON") {
        //     withAnimation(.bouncy) {
        //         showAnimation = true
        //     }
        // }
        // Button("Animation OFF") {
        //     withAnimation(.bouncy) {
        //         showAnimation = false
        //     }
        // }
    }
    
    func topTitle() -> some View {
        Text("My Title")
            .font(.largeTitle)
            .bold()
            .frame(maxWidth: .infinity, alignment: showAnimation ? .leading : .center)
            .overlay(alignment: .trailing,
                     content: {
                topButton()
            })
            .padding()
    }
    
    func topButton() -> some View {
        Button(action: {
            withAnimation(.bouncy) {
                showAnimation = false
            }
        }, label: {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .padding(10)
                .background(.black, in: .circle)
        })
        .rotationEffect(.degrees(showAnimation ? 225 : 45))
        .opacity(showAnimation ? 1 : 0)
    }
    
    func cardContainer() -> some View {
        Button(action: {
            withAnimation(.bouncy) {
                showAnimation = true
            }
        }, label: {
            ScrollView {
                ForEach(list, id: \.id) { item in
                    cardView(item)
                }
            }
        })
        
    }
    
    func cardView(_ item: CardModel) -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(item.color)
            .frame(height: 130)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .offset(y: item.index * (showAnimation ? 0 : -100))
    }
    
}

#Preview {
    BasicAnimationView()
}
