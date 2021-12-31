//
//  ShitCounter.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 28/12/2021.
//

import SwiftUI

@main
struct ShitCounter: App {
    var body: some Scene {
        WindowGroup {
            StartupView().environment(\.managedObjectContext, PersistenceProvider.default.context)
        }
    }
}
