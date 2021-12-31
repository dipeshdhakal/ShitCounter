//
//  ShitConfigView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 19/12/21.
//

import Foundation
import SwiftUI

struct AddNoteView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isPresented = false
    @ObservedObject var viewModel: AddNoteViewModel
    
    init(note: ShitNote?) {
        viewModel = AddNoteViewModel(note: note)
    }
    
    var body: some View {
        
        NavigationView {
            
            Form(content: {
                
                Section(header: Text(ShitNotesString.addNoteTitle.rawValue).foregroundColor(Color.text)) {
                    TextField(ShitNotesString.addNoteTitle.rawValue, text: $viewModel.noteTitle).onChange(of: viewModel.noteTitle, perform: { newValue in
                        viewModel.updateButtonState()
                    })
                }
                .font(.formSectionFont)
                .listRowBackground(Color.clear)
                
                Section(header: Text(ShitNotesString.addNoteDetail.rawValue).foregroundColor(Color.text)) {
                    
                    ZStack(alignment: .leading) {
                        if viewModel.noteDetails.isEmpty {
                            Text(ShitNotesString.noteDetailsPlaceholder.rawValue)
                                .foregroundColor(Color.gray)
                        }
                        
                        TextEditor(text: $viewModel.noteDetails).onChange(of: viewModel.noteDetails, perform: { newValue in
                            viewModel.updateButtonState()
                        }).lineLimit(5)
                            .font(.cellDetailFont)
                    }
                }
                .font(.formSectionFont)
                .listRowBackground(Color.clear)
                
                Section {
                    ShitButton(text: ShitNotesString.addNoteButton.rawValue) {
                        viewModel.saveNote()
                        presentationMode.wrappedValue.dismiss()
                    }.disabled(!viewModel.saveButtonEnabled)
                }
                .listRowBackground(Color.clear)
            })
                .padding(.top, 30)
                .navigationBarTitle(Text(ShitNotesString.addNoteNavTitle.rawValue), displayMode: .inline)
                .background(Color.background)
                .navigationBarItems(leading: Button(action: {
                    isPresented = true
                }) {
                    Text(ShitNotesString.addNoteDelete.rawValue)
                        .font(.buttonTitleFont)
                        .opacity(viewModel.note == nil ? 0 : 1)
                }, trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text(ShitNotesString.addNoteCancel.rawValue)
                        .font(.buttonTitleFont)
                })
                .popup(isPresented: $isPresented) {
                    BottomPopupView {
                        InfoPopupView(isPresented: $isPresented, title: ShitNotesString.deleteConfirmTitle.rawValue) { success in
                            viewModel.deleteNote()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                .ignoresSafeArea(.all)
        }
        
    }
    
}

//struct AddNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNoteView(viewModel: AddNoteViewModel())
//    }
//}

