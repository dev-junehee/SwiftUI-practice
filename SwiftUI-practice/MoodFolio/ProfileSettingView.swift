//
//  ProfileSettingView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    
    @State private var nickname = ""
    
    let buttonList1 = ["E", "S", "T", "J"]
    let buttonList2 = ["I", "N", "F", "P"]
    
    var body: some View {
        NavigationWrapper {
            VStack {
                /// 상단 프로필 이미지 영역 (프로필 이미지 설정 화면 연결)
                NavigationLink {
                    ProfileImageSettingView()
                } label: {
                    Image(.profile8)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFill()
                        .clipShape(.circle)
                }
                
                /// 닉네임 필드
                TextField("닉네임을 입력하세요.", text: $nickname)
                    .padding()
                
                /// MBTI
                HStack(alignment: .top) {
                    Text("MBTI")
                        .bold()
                        .frame(width: 100, height: 130, alignment: .topLeading)
                        // .background(.red)
                        
                    VStack {
                        HStack {
                            ForEach(buttonList1, id: \.self) { item in
                                Button(item) {
                                    print("item")
                                }
                                .padding()
                                .foregroundStyle(.white)
                                .background(.blue)
                                .clipShape(.circle)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {
                            ForEach(buttonList2, id: \.self) { item in
                                Button(item) {
                                    print("item")
                                }
                                .padding()
                                .foregroundStyle(.white)
                                .background(.blue)
                                .clipShape(.circle)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        // .background(.red)
                    }
                    
                }
                .padding()
                
                Spacer()
                
                /// 하단 완료 버튼
                NavigationLink {
                    ResultView()
                } label: {
                    CustomButton(titleKey: "완료") { return }
                }
            }
            .navigationTitle("프로필 설정")
            .navigationBarTitleDisplayMode(.inline)
            // .navigationBarBackButtonHidden()
            // .toolbar {
            //     ToolbarItem(placement: .topBarLeading) {
            //         Button(action: {
            //             /// 뒤로가기?
            //         }, label: {
            //             Image(systemName: "chevron.left")
            //                 .tint(.black)
            //         })
            //     }
            // }
        }
    }
}

#Preview {
    ProfileSettingView()
}
