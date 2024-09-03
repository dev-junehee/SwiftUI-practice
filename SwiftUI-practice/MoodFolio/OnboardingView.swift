//
//  OnboardingView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/2/24.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        NavigationWrapper {
            Image(.launchTitle)
                .frame(height: 200)
            Image(.launch)
            Spacer()
            NavigationLink {
                ProfileSettingView()
            } label: {
                CustomButton(titleKey: "시작하기") { return }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
