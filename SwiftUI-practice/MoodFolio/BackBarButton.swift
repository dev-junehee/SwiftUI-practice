//
//  BackBarButton.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/2/24.
//

import SwiftUI

struct BackBarButton: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            HStack {
               Image(systemName: "chevron.left")
                   .tint(.black)
                   .aspectRatio(contentMode: .fit)
            }
        })
    }
}

#Preview {
    BackBarButton()
}
