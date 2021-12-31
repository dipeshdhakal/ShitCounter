//
//  BottomPopupView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 24/10/21.
//

import SwiftUI

struct BottomPopupView<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                content
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    .background(Color.background)
                    .cornerRadius(radius: 16, corners: [.topLeft, .topRight])
                    .shadow(color: .shadow, radius: 16, x: 16, y: 16)
            }
            .edgesIgnoringSafeArea([.bottom])
        }
        .animation(.easeOut)
        .transition(.move(edge: .bottom))
    }
}
