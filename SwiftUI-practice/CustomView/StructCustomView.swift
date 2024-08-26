//
//  StructCustomView.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/26/24.
//

import SwiftUI

struct StructCustomView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .padding()
            .background(Color(red: .random(in: 0...1),
                             green: .random(in: 0...1),
                             blue: .random(in: 0...1))
           )
    }
}

#Preview {
    StructCustomView(text: "1")
}
