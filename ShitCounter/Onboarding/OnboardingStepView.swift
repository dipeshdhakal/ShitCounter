//
//  OnboardingStepView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 31/12/21.
//

import SwiftUI

struct OnboardingStepView: View {
    
    var data: OnboardingDataModel
    
    var body: some View {
        VStack {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300, alignment: .center)
                .padding(.bottom, 50)
                .foregroundColor(.text)
            
            Text(data.heading)
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .foregroundColor(.text)
            
            Text(data.text)
                .font(.system(size: 17, design: .rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.text)
        }
        .padding()
        .contentShape(Rectangle())
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var data = OnboardingDataModel.data[0]
    static var previews: some View {
        OnboardingStepView(data: data)
    }
}
