//
//  MainTabView.swift
//  StepCounter
//
//  Created by Dipesh Dhakal on 19/12/21.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        
        NavigationView {
            TabView {
                ShitLoggerView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: ShitLogImage.tabIcon.rawValue)
                        Text(ShitLogString.tabName.rawValue)
                    }.navigationBarTitle("")
                    .navigationBarHidden(true)
                
                NotesView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: ShitNotesImage.noteIcon.rawValue)
                        Text(ShitNotesString.tabName.rawValue)
                    }.navigationBarTitle("")
                    .navigationBarHidden(true)
                
                SettingsView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: SettingsImage.tabIcon.rawValue)
                        Text(SettingString.navTitle.rawValue)
                    }.navigationBarTitle("")
                    .navigationBarHidden(true)
                
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
