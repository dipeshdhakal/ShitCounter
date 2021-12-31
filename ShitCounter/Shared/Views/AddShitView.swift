//
//  AddShitView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 23/12/21.
//

import SwiftUI

struct AddShitView: View {
    
    @Binding var isPresented: Bool
    @State var shitNotes: String = ""
    @State var shitDate = Date()
    
    var body: some View {
        
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 20) {
                
                HStack {
                    Spacer()
                    Image(systemName: ShitLogImage.addShitClose.rawValue)
                        .resizable()
                        .foregroundColor(.accent)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            isPresented = false
                        }
                }
                
                Image(ShitLogImage.addShitIcon.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .foregroundColor(Color.accent)
                    .frame(width: 60, height: 60)
                
                Text(ShitLogString.addShitTitle.rawValue)
                    .foregroundColor(.text)
                    .font(.cellTitleFont)
                
                DatePicker(ShitLogString.addShitDate.rawValue,
                           selection: $shitDate,
                           displayedComponents: [.date])
                    .font(.cellDetailFont)
                    .foregroundColor(.text)
                
                TextField(ShitLogString.addShitNote.rawValue, text: $shitNotes)
                    .font(.cellDetailFont)
                    .foregroundColor(.text)
                
                ShitButton(text: ShitLogString.addShitButton.rawValue) {
                    PersistenceProvider.default.addShitLog(shitDate: shitDate, note: shitNotes)
                    isPresented = false
                }
            }
            Spacer()
        }
        .padding()
    }
}
