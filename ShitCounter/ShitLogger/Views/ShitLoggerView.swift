//
//  ShitLoggerView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 28/12/2021.
//

import SwiftUI

struct ShitLoggerView: View {
    
    @State private var showAddShit = false
    @State private var isLoaderPresented = false
    @State var logShitIsPresented = false
    @State var shitConfigIsPresented = false
    
    @ObservedObject var viewModel = ShitLoggerViewModel()
    
    var body: some View {
        
        BaseView(content:
                    VStack {
            HStack(alignment: .top) {
                NavigationLink(destination: ShitHistoryView()) {
                    Image(systemName: ShitLogImage.calendar.rawValue)
                        .resizable()
                        .frame(width: .navigationButton, height: .navigationButton)
                        .foregroundColor(.accent)
                        .padding(.leading, .horizontalPadding)
                }
                .opacity(viewModel.shitLoggerSetup ? 1 : 0)
                Spacer()
                Text(ShitLogString.navTitle.rawValue)
                    .foregroundColor(.text)
                    .font(.navigationTitleFont)
                Spacer()
                Image(systemName: ShitLogImage.addShitLog.rawValue)
                    .resizable()
                    .frame(width: .navigationButton, height: .navigationButton)
                    .foregroundColor(.accent)
                    .padding(.trailing, .horizontalPadding)
                    .onTapGesture {
                        self.logShitIsPresented = true
                    }
                    .opacity(viewModel.shitLoggerSetup ? 1 : 0)
            }
            
            ScrollView {
                
                if viewModel.shitLoggerSetup {
                    ProgressGoalView()
                        .padding(.top, 40)
                } else {
                    ShitLogSetterView()
                        .padding(.horizontalPadding)
                        .onTapGesture {
                            self.shitConfigIsPresented = true
                        }
                }
                
                Spacer(minLength: 100)
                
                ShitPeriodsView()
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                
                Spacer()
            }
        })
            .navigationBarHidden(true)
            .sheet(isPresented: $shitConfigIsPresented, content: {
                ShitConfigView()
            })
            .popup(isPresented: $logShitIsPresented) {
                BottomPopupView {
                    AddShitView(isPresented: $logShitIsPresented)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShitLoggerView()
    }
}
