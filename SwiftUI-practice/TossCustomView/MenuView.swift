//
//  MenuView.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/27/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        HStack {
            CustomMenuButton(image: "house", title: "토스뱅크")
            CustomMenuButton(image: "clipboard", title: "토스증권")
            CustomMenuButton(image: "mic", title: "고객센터")
        }
        .padding()
    }
}

#Preview {
    MenuView()
}
