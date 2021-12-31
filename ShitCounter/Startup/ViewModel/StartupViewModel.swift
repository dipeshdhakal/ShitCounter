//
//  StartupViewModel.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 28/12/2021.
//

import SwiftUI

struct VersionKey {
    static let appBuild = "CFBundleVersion"
    static let appName = "CFBundleName"
    static let appVersion = "CFBundleShortVersionString"
    static let currentVersion = "CurrentVersion"
}

class StartupViewModel: ObservableObject {
    
    enum State {
        case loading
        case startupComplete
        case onboardingInComplete
    }
    
    let onboardingCompleteKey = "ONBOARDING_COMPLETE"
    var onboardingData = OnboardingDataModel.data
    
    @Published var state: State = .loading
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        updateStartup()
    }
    
    func updateStartup() {
        
        migrateVersion()
        if UserDefaults.standard.bool(forKey: onboardingCompleteKey) {
            state = .startupComplete
        } else {
            state = .onboardingInComplete
        }
        
    }
    
    func finishOnboarding() {
        UserDefaults.standard.set(true, forKey: onboardingCompleteKey)
        updateStartup()
    }
    
    func migrateVersion() {
        if let currentVersion = Bundle.main.object(forInfoDictionaryKey: VersionKey.appVersion) as? String {
            UserDefaults.standard.set(currentVersion, forKey: VersionKey.currentVersion)
        }
    }
    
}
