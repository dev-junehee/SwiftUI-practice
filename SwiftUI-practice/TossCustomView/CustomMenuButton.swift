//
//  MenuButton.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/27/24.
//

import SwiftUI

struct CustomMenuButton: View {
    let image: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .padding(4)
            Text(title)
        }
        .padding()
    }
}

#Preview {
    CustomMenuButton(image: "house", title: "토스뱅크")
}
