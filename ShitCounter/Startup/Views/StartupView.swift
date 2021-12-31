//
//  StartupView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 28/12/2021.
//

import SwiftUI

struct StartupView: View {
    
    @ObservedObject var viewModel = StartupViewModel()
    
    var body: some View {
        switch viewModel.state {
            case .loading:
                ZStack {
                    Color.background
                    Image("shit-icon")
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fill)
                        .foregroundColor(Color.accent)
                        .frame(width: 100, height: 100)
                }
                .ignoresSafeArea(.all)
            case .startupComplete:
                MainTabView()
            case .onboardingInComplete:
                OnboardingView(data: viewModel.onboardingData, doneFunction: {
                    viewModel.finishOnboarding()
                })
        }
    }
}
