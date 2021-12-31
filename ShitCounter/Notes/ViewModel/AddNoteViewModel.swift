//
//  AddNoteViewModel.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 26/12/2021.
//

import SwiftUI

class AddNoteViewModel: ObservableObject {
    
    @Published var noteDate = Date()
    @Published var noteTitle: String = ""
    @Published var noteDetails: String = ""
    @Published var saveButtonEnabled: Bool = false
    
    var note: ShitNote?
    
    init(note: ShitNote? = nil) {
        self.note = note
        if let note = note {
            noteTitle = note.title ?? ""
            noteDetails = note.details ?? ""
            noteDate = note.date
        }
    }
    
    
    func saveNote() {
        PersistenceProvider.default.saveShitNote(id: note?.id, title: noteTitle, details: noteDetails)
        NotificationCenter.default.post(name: .ShitNoteUpdated, object: nil)
    }
    
    func deleteNote() {
        note?.delete()
        NotificationCenter.default.post(name: .ShitNoteUpdated, object: nil)
    }
    
    func updateButtonState() {
        saveButtonEnabled = !noteTitle.isEmpty && !noteDetails.isEmpty
    }
    
}
