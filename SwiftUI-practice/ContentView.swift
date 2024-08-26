//
//  ContentView.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "house")
                    .padding(4)
                Text("토스뱅크")
            }
            .padding()
            VStack {
                Image(systemName: "clipboard")
                    .padding(4)
                Text("토스증권")
            }
            .padding()
            VStack {
                Image(systemName: "mic")
                    .padding(4)
                Text("고객센터")
            }
            .padding()
        }
        .padding()
        
        Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
            .font(.title.bold())
            .padding(20)
        
        VStack {
            HStack {
                Image(systemName: "bookmark")
                Text("매일 포인트 받는 출석체크/퀴즈")
                    .font(.title3.bold())
                Spacer()
            }
            .padding(.bottom)
            HStack {
                Image(systemName: "heart")
                Text("새로운 이벤트")
                    .font(.title3.bold())
                Spacer()
            }
            .padding(.bottom)
            HStack {
                Image(systemName: "star")
                Text("미션 추천")
                    .font(.title3.bold())
                Spacer()
            }
        }
        .padding(30)
            
        Spacer()
            
        VStack(alignment: .leading) {
            Text("[선택] 맞춤형 서비스 이용 동의")
                .padding()
                .foregroundStyle(.gray)
            
            Button("동의하기") {
                print("버튼 클릭")
            }
            .frame(width: 360, height: 50)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.buttonBorder)
            
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
    ContentView()
}
