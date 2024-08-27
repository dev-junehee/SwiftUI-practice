//
//  ContentView.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        MenuView()
        Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
            .font(.title.bold())
            .padding(20)
        EventView()
        Spacer()
        ButtonView()
    }
}


#Preview {
    ContentView()
}
