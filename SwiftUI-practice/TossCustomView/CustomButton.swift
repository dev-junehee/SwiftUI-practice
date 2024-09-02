//
//  CustomButton.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/27/24.
//

import SwiftUI

struct CustomButton: View {
    let titleKey: String
    let action: () -> Void
    
    var body: some View {
        Button(titleKey, action: action)
        .frame(width: 360, height: 50)
        .foregroundStyle(.white)
        .background(.blue)
        .clipShape(.capsule)
    }
}

// #Preview {
//     CustomButton(titleKey: "동의하기")
// }
