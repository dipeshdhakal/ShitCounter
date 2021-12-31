//
//  CardView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 24/10/21.
//
import Foundation
import SwiftUI

struct CardView<Content>: View where Content: View {
    
    let backgroundColor: Color
    let content: Content

    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(backgroundColor)
                .shadow(color: Color.gray, radius: 4, x: 0, y: 0)
            content
        }
    }
}
