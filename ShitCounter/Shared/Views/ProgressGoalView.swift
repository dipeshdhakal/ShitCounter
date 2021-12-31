//
//  ProgressGoalView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 24/10/21.
//

import SwiftUI

struct ProgressGoalView: View {
    
    @ObservedObject var viewModel = ProgressGoalViewModel()
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(RadialGradient(
                            gradient: Gradient(colors: [Color.shadow.opacity(0.2), Color.shadow.opacity(0.3)]),
                            center: .center,
                            startRadius: 80,
                            endRadius: 300),
                        lineWidth: 40)
                .frame(width: 260, height: 260)
            
            Circle()
                .trim(from: 0.0, to: viewModel.goalProgress)
                .stroke(LinearGradient(
                            gradient: Gradient(
                                colors: [Color.accent]),
                            startPoint: .top,
                            endPoint: .trailing),
                        style: StrokeStyle(
                            lineWidth: 40,
                            lineCap: .round))
                .frame(width: 260, height: 260)
                .rotationEffect(.degrees(-90))
                .shadow(color: Color.shadow, radius: 20)
            
            VStack(spacing: 12) {
                Text(viewModel.centerTitle)
                    .foregroundColor(.text)
                    .font(.superLargeBoldFont)
                Text(viewModel.centerSubtitle)
                    .foregroundColor(.text)
                    .font(.cellTitleFont)
            }
            .foregroundColor(.white)
                
        }
    }
    
    func getFormeattedInt(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = false
        return formatter.string(from: NSNumber(value: number))!
    }
}
