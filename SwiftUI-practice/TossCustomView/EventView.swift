//
//  EventView.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/27/24.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        VStack {
            CustomEventLabel(image: "bookmark", text: "매일 포인트 받는 출석체크와 퀴즈")
            CustomEventLabel(image: "heart", text: "새로운 이벤트")
            CustomEventLabel(image: "star", text: "미션 추천")
        }
        .padding(30)
    }
}

#Preview {
    EventView()
}
