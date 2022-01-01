//
//  StartupViewModelTests.swift
//  ShitCounterUnitTest
//
//  Created by Dipesh Dhakal on 2/1/2022.
//

import XCTest
@testable import ShitCounter

class StartupViewModelTests: XCTestCase {
    
    var viewModel: StartupViewModel!

    override func setUpWithError() throws {
        
    }

    func testStateComplete() throws {
        viewModel = StartupViewModel()
        XCTAssertEqual(viewModel.state, .startupComplete)
    }

    
    func testOnboardingState() throws {
        UserDefaults.standard.set(false, forKey: "ONBOARDING_COMPLETE")
        viewModel = StartupViewModel()
        XCTAssertEqual(viewModel.state, .onboardingInComplete)
        viewModel.finishOnboarding()
        XCTAssertEqual(viewModel.state, .startupComplete)
    }
    
    func testSaveVersion() throws {
        viewModel = StartupViewModel()
        let savedVersion =  UserDefaults.standard.string(forKey: VersionKey.currentVersion)
        let currentVersion = Bundle.main.object(forInfoDictionaryKey: VersionKey.appVersion) as? String
        viewModel.migrateVersion()
        XCTAssertEqual(savedVersion, currentVersion)
    }

}
