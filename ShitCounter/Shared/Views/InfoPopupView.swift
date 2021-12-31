//
//  InfoPopupView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 24/12/21.
//

import Foundation
import SwiftUI

struct InfoPopupView: View {
    
    @Binding var isPresented: Bool
    
    var title: String = ""
    var details: String = ""
    var success: ((Bool) -> Void)?
        
    var body: some View {
        
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 20) {
                
                HStack {
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .foregroundColor(.accent)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            isPresented = false
                        }
                }
                
                Image(systemName: "info.circle")
                    .resizable()
                    .foregroundColor(Color.accent)
                    .aspectRatio(contentMode: ContentMode.fill)
                    .frame(width: 60, height: 60)
                
                Text(title)
                    .foregroundColor(.text)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Text(details)
                    .foregroundColor(.text)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                
                ShitButton(text: "Confirm") {
                    isPresented = false
                    success?(true)
                }
            }
            Spacer()
        }
        .padding()
    }
}
