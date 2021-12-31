//
//  ShitPeriodsView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 28/12/2021.
//


import SwiftUI

struct ShitPeriodsView: View {
    
    @ObservedObject var viewModel = ShitPeriodViewModel()
    
    var body: some View {
        HStack {
            
            ShitPeriodView(period: viewModel.periods[0])
            
            Spacer()
            
            Rectangle()
                .fill(Color.separator)
                .frame(width: 1, height: 200)
                .opacity(0.2)
            
            Spacer()
            
            ShitPeriodView(period:viewModel.periods[1])
            
            Spacer()
            
            Rectangle()
                .fill(Color.separator)
                .frame(width: 1, height: 200)
                .opacity(0.2)
            
            Spacer()
            
            ShitPeriodView(period: viewModel.periods[2])
        }
    }
}

struct ShitPeriodView: View {
    
    let period: ShitPeriod
    
    var body: some View {
        VStack {
            Image(period.iconName)
                .resizable()
                .foregroundColor(period.color)
                .scaledToFill()
                .frame(width: 60, height: 60, alignment: .center)
                .shadow(color: period.color.opacity(0.5), radius: 10, x: 4, y: 24)
            
            Text(period.value == -1 ? "?" : "\(period.value)")
                .foregroundColor(Color.text)
                .font(.titleBoldFont)
                .fixedSize()
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            Text(period.title)
                .foregroundColor(Color.text)
                .font(.titleFont)
        }
        .foregroundColor(.white)
    }
}
