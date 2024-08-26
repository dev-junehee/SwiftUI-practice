//
//  CustomViewPractice.swift
//  SwiftUI-practice
//
//  Created by junehee on 8/26/24.
//

import SwiftUI

struct CustomViewPractice: View {
    
    @State private var number = 0
    
    /// 연산 프로퍼티 커스텀 뷰 (매개변수 활용 X)
    var customViewProperty: some View {
        Text("Property : \(number)")
            .font(.title)
            .padding()
            .background(Color(red: .random(in: 0...1),
                             green: .random(in: 0...1),
                             blue: .random(in: 0...1))
           )
    }
    
    /// 메서드 커스텀 뷰 (매개변수 활용 O)
    func customViewMethod(title: String) -> some View {
        Text("\(title) : \(number)")
            .font(.title)
            .padding()
            .background(Color(red: .random(in: 0...1),
                             green: .random(in: 0...1),
                             blue: .random(in: 0...1))
           )
    }
    
    /**
     @State가 변경되면 body가 다시 그려진다. (Source of Truth)
     >>> 프로퍼티, 메서드로 만들어진 커스텀뷰도 다시 렌더링 된다.
     >>> 구조체로 만든 커스텀뷰의 init 구문은 실행되지만, 구조체의 body는 재렌더링되지 않는다.
     */
    var body: some View {
        /// 구조체 커스텀뷰
        StructCustomView(text: "구조체로 만들었어요")    /// 버튼 클릭 시 배경색 안 변함
        /// 프로퍼티 커스텀뷰
        customViewProperty  /// 버튼 클릭 시 배경색 변함
        /// 메서드 커스텀뷰
        customViewMethod(title: "Method")   /// 버튼 클릭 시 배경색 변함
        
        HStack {
            Button("더하기") {
                number += 1
            }
            Button("빼기") {
                number -= 1
            }
        }
        .font(.title)
        .padding()
        
    }
}

#Preview {
    CustomViewPractice()
}
