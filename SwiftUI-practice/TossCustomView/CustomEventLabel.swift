//
//  CustomEventLabel.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/27/24.
//

import SwiftUI

struct CustomEventLabel: View {
    let image: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
                .font(.title3.bold())
            Spacer()
        }
        .padding(.bottom)
    }
}

#Preview {
    CustomEventLabel(image: "bookmark", text: "매일 포인트 받는 출석체크와 퀴즈")
}
