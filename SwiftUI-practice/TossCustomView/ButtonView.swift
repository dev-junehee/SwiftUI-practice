//
//  ButtonView.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/27/24.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("[선택] 맞춤형 서비스 이용 동의")
                .padding()
                .foregroundStyle(.gray)
            
            CustomButton(titleKey: "동의하기")
            
            Button("다음에 하기") {
                print("다음에 하기")
            }
            .frame(width: 360, height: 30)
            .clipShape(.buttonBorder)
            .foregroundStyle(.gray)
        }
    }
}

#Preview {
    ButtonView()
}
