//
//  ShitButton.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 28/12/2021.
//

import SwiftUI

struct ShitButton: View {
    
    var text: String
    var icon: Image?
    var clicked: (() -> Void)
    @Environment(\.isEnabled) private var isEnabled
    
    var body: some View {
        Button(action: clicked) {
            HStack {
                Spacer()
                Text(text)
                    .foregroundColor(Color.buttontextColor)
                if let icon = icon {
                    icon
                }
                Spacer()
            }
            .font(Font.buttonTitleFont)
            .foregroundColor(Color.white)
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .background(isEnabled ? Color.accent : Color.shadow)
            .cornerRadius(16)
        }
    }
}

struct ContentView: View {
    var body: some View {
        ShitButton(
            text: "Custom Button",
            icon: Image(systemName: "plus")
        ) {
            print("Clicked!")
        }
    }
}
