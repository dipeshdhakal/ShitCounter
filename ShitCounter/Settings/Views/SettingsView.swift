//
//  SettingsView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 24/12/21.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel = SettingsViewModel()
    @State private var presentView: Bool = false
    
    var body: some View {
        BaseView(content:
                    VStack {
            Text(SettingString.navTitle.rawValue)
                .foregroundColor(.text)
                .font(.navigationTitleFont)
            Form {
                Section(header: Text(SettingString.notificationSection.rawValue)) {
                    Toggle(isOn: $viewModel.isNotificationEnabled) {
                        Text(SettingString.notificationTitle.rawValue)
                            .font(.titleFont)
                            .foregroundColor(Color.text)
                    }
                }
                .listRowBackground(Color.clear)
                Section(header: Text(SettingString.shitSettingSection.rawValue)) {
                    ShitButton(text: viewModel.shitIsSet ? SettingString.editShit.rawValue : SettingString.addShit.rawValue) {
                        self.presentView = true
                    }
                }
                .listRowBackground(Color.clear)
            }
            Spacer()
        })
            .sheet(isPresented: $presentView, content: {
                ShitConfigView()
            })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
