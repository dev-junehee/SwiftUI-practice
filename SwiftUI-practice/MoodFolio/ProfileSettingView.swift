//
//  ProfileSettingView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    
    @State private var nickname = ""
    @State private var mbti = ["", "", "", ""]
    
    let buttonList1 = ["E", "S", "T", "J"]
    let buttonList2 = ["I", "N", "F", "P"]
    
    @State private var buttonState1 = [false, false, false, false]
    @State private var buttonState2 = [false, false, false, false]
    
    var body: some View {
        NavigationWrapper {
            VStack {
                profileNicknameView()
                mbtiView()
                Spacer()
                buttonView()
            }
            .navigationTitle("프로필 설정")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func profileNicknameView() -> some View {
        VStack {
            NavigationLink {
                ProfileImageSettingView()
            } label: {
                Image(.profile8)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFill()
                    .clipShape(.circle)
            }
            
            TextField("닉네임을 입력하세요.", text: $nickname)
                .padding()
        }
    }
    
    private func mbtiView() -> some View {
        HStack(alignment: .top) {
            Text("MBTI")
                .bold()
                .frame(width: 100, height: 130, alignment: .topLeading)
                
            VStack {
                HStack {
                    ForEach(buttonList1, id: \.self) { item in
                        Button(item) {
                            
                        }
                        .padding()
                        .foregroundStyle(.white)
                        .background(.gray)
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
                        .background(.gray)
                        .clipShape(.circle)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            
        }
        .padding()
    }
    
    private func buttonView() -> some View {
        NavigationLink {
            ResultView()
        } label: {
            CustomButton(titleKey: "완료") { return }
        }
    }
    
}

#Preview {
    ProfileSettingView()
}
