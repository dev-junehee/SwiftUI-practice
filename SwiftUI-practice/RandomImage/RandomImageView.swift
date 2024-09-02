//
//  RandomImageView.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/29/24.
//

import SwiftUI

/// 상위 뷰
private struct RandomImageView: View {
    
    @State private var number = Int.random(in: 1...100)
    
    var body: some View {
        RandomButtonView(number: $number)
        
        AsyncImage(url: URL(string: "https://picsum.photos/id/\(number)/200/300"))
            .frame(width: 200, height: 300)
    }
}

/// 하위 뷰
private struct RandomButtonView: View {
    
    @Binding var number: Int
    
    var body: some View {
        Button(action: {
            number = Int.random(in: 1...100)
        }, label: {
            Text("이미지 다시 가져오기")
                .font(.title)
                .foregroundStyle(.white)
                .background(.yellow)
        })
    }
}

#Preview {
    RandomImageView()
}
