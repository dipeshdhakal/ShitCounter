//
//  NotesView.swift
//  StepCounter
//
//  Created by Dipesh Dhakal on 19/12/21.
//

import Foundation
import SwiftUI

struct NotesView: View {
    
    @ObservedObject var viewModel = NotesViewModel()
    @State var addNotePresented = false
    
    var body: some View {
        
        BaseView(content:
                    
        VStack {
            HStack(alignment: .top) {
                Spacer()
                Spacer()
                Text(ShitNotesString.tabName.rawValue)
                    .foregroundColor(.text)
                    .font(.navigationTitleFont)
                Spacer()
                Image(systemName: ShitNotesImage.addNotes.rawValue).resizable()
                    .frame(width: .navigationButton, height: .navigationButton)
                    .foregroundColor(.accent)
                    .padding(.trailing, .horizontalPadding)
                    .onTapGesture {
                        viewModel.currentNote = nil
                        self.addNotePresented = true
                    }
            }
            if viewModel.notes.count > 0 {
                List(viewModel.notes, id: \.self) { note in
                    HStack(spacing: 10) {
                        Image(systemName: ShitNotesImage.noteIcon.rawValue)
                        VStack(alignment: .leading, spacing: 5) {
                            Text(note.title ?? "")
                                .foregroundColor(Color.text)
                                .font(.cellTitleFont)
                            Text(note.date.formattedString)
                                .foregroundColor(Color.text)
                                .font(.cellDetailFont)
                        }
                        .padding(10)
                        Spacer()
                        Image(systemName: ShitNotesImage.chevron.rawValue)
                            .font(Font.system(.caption).weight(.bold))
                            .foregroundColor(.gray)
                    }
                    .listRowBackground(Color.clear)
                    .onTapGesture {
                        viewModel.currentNote = note
                        self.addNotePresented = true
                    }
                }
                Spacer()
            } else {
                Spacer()
                Text(ShitNotesString.addNoteDetails.rawValue)
                    .foregroundColor(Color.text)
                    .font(Font.cellTitleFont)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
            Spacer()
        })
            .sheet(isPresented: $addNotePresented, content: {
                AddNoteView(note: viewModel.currentNote)
            })
        
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
