//
//  ShitConfigView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 19/12/21.
//

import Foundation
import SwiftUI

struct ShitConfigView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = ShitConfigViewModel()
    
    @State var isPresented = false
    
    var body: some View {
        
        NavigationView {
            
            Form(content: {
                
                Section(header: Text(ShitLogString.shitConfigDateSection.rawValue)) {
                    DatePicker(ShitLogString.shitConfigStartDate.rawValue,
                               selection: $viewModel.shitStartDate,
                               displayedComponents: [.date])
                    DatePicker(ShitLogString.shitConfigEndDate.rawValue,
                               selection: $viewModel.shitEndDate,
                               displayedComponents: [.date])
                }
                .font(.formSectionFont)
                .listRowBackground(Color.clear)
                
                Section(header: Text(ShitLogString.shitConfigGoalSection.rawValue)) {
                    TextField(ShitLogString.shitConfigGoalPlaceholder.rawValue, text: $viewModel.goalShitCount).onChange(of: viewModel.goalShitCount, perform: { newValue in
                        viewModel.updateButtonState()
                    }).keyboardType(.numberPad)
                }
                .font(.formSectionFont)
                .listRowBackground(Color.clear)
                
                Section {
                    ShitButton(text: ShitLogString.shitConfigButton.rawValue) {
                        viewModel.saveShitConfig()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(!viewModel.saveButtonEnabled)
                }
                .listRowBackground(Color.clear)
            })
                .padding(.top, 30)
                .background(Color.background)
                .navigationBarTitle(Text(ShitLogString.shitConfigNavTitle.rawValue), displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    isPresented = true
                }) {
                    Text(ShitLogString.shitConfigDelete.rawValue)
                        .font(.buttonTitleFont)
                        .opacity(viewModel.shitSet ? 1 : 0)
                }, trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text(ShitLogString.shitConfigCancel.rawValue)
                        .font(.buttonTitleFont)
                })
                .popup(isPresented: $isPresented) {
                    BottomPopupView {
                        InfoPopupView(isPresented: $isPresented, title: ShitLogString.shitConfigDeleteTitle.rawValue, details: ShitLogString.shitConfigDeleteMessage.rawValue) { success in
                            PersistenceProvider.default.deleteAllLogs()
                            PersistenceProvider.default.deleteConfig()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                .ignoresSafeArea(.all)
        }
    }
    
}
