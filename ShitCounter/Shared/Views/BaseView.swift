//
//  BaseView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 24/10/21.
//

import Foundation
import SwiftUI

struct BaseView<Content>: View where Content: View {
    
    let content: Content

    var body : some View {
        ZStack {
            Color.background
                .ignoresSafeArea(.all)
            content
        }
    }
}
