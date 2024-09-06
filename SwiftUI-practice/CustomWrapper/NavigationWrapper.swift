//
//  NavigationWrapper.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/2/24.
//

import SwiftUI

struct NavigationWrapper<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                content
            }
        } else {
            NavigationView {
                content
            }
        }
    }
}
