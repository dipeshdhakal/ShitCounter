//
//  OnboardingDataModel.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 31/12/21.
//

import Foundation

struct OnboardingDataModel {
    var image: String
    var heading: String
    var text: String
}

extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
        OnboardingDataModel(image: "onboarding-app", heading: "The App", text: "Log your Shit, set a goal for your Shit within a time period, count and track it. Store your data to secured Apple's first party Cloudkit so that its never lost."),
        OnboardingDataModel(image: "onboarding-notes", heading: "The Privacy", text: "This App does not log or track any of your data. Why would we? Its shit anyways LOL. No Analytics and no backend to track you."),
        OnboardingDataModel(image: "onboarding-privacy", heading: "The Notes", text: "Some of the great thoughts come when you shit. If fact, this App idea came to me when I was shitting. Quickly save them in note before you flush them with your shit."),
    ]
}
