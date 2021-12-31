//
//  ShitLogSetterView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 19/12/21.
//

import Foundation
import SwiftUI

struct ShitLogSetterView: View {
    
    var body: some View {
        CardView(backgroundColor: Color.background, content:
                    VStack(alignment: .center, spacing: 20) {
            Image(systemName: ShitLogImage.addShitWidget.rawValue)
                .foregroundColor(.accent).frame(width: 40, height: 40, alignment: .center)
            Text(ShitLogString.addShitWidgetTitle.rawValue).foregroundColor(.text)
                .font(.cellDetailFont)
                .multilineTextAlignment(.center)
            Text(ShitLogString.addShitWidgetDetails.rawValue)
                .font(Font.buttonTitleFont)
                .foregroundColor(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color.accent)
                .cornerRadius(16)
        }.padding()
        ).padding()
    }
}
