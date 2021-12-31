//
//  TopBarView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 27/12/2021.
//

import SwiftUI

enum ActionButton {
    case button(name: String, action: () -> Void)
    case navigationLink(name: String, destination: ShitHistoryView)
}

struct TopBarView: View {
    
    var title: String?
    var leftButton: ActionButton?
    var rightButton: ActionButton?
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            if let leftButton = leftButton {
                switch leftButton {
                case .button(let name, let action):
                    Image(systemName: name).foregroundColor(.white).padding().onTapGesture {
                        action()
                    }
                case .navigationLink(let name, let destination):
                    NavigationLink(destination: destination) {
                        Image(systemName: name).foregroundColor(.white).padding()
                    }
                }
            }
            
            Spacer()
            if let title = title {
                Text(title).foregroundColor(.white)
            }
            Spacer()
            
            if let rightButton = rightButton, case .button(let name, let action) = rightButton{
                Image(systemName: name).foregroundColor(.white).padding().onTapGesture {
                    action()
                }
            }
        }.padding(.top, 44)
    }
}
