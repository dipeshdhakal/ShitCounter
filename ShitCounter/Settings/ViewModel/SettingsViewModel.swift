//
//  SettingsViewModel.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 24/12/21.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    
    @Published var shitIsSet: Bool = false
    
    private enum Keys {
        static let notificationEnabled = "notifications_enabled"
    }
    
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        updateSettings()
        NotificationCenter.default.addObserver(self, selector: #selector(updateSettings), name: .ShitConfigUpdated, object: nil)
    }
    
    var isNotificationEnabled: Bool {
        set { defaults.set(newValue, forKey: Keys.notificationEnabled) }
        get { defaults.bool(forKey: Keys.notificationEnabled) }
    }
    
    @objc
    func updateSettings() {
        if PersistenceProvider.default.shitStatus != nil {
            shitIsSet = true
        }
    }
}
