//
//  NotesViewModel.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 26/12/2021.
//

import SwiftUI

class NotesViewModel: ObservableObject {
    
    @Published var notes: [ShitNote] = []
    var currentNote: ShitNote?
    
    init() {
        prepareNotes()
        NotificationCenter.default.addObserver(self, selector: #selector(prepareNotes), name: .ShitNoteUpdated, object: nil)
    }
    
    @objc
    func prepareNotes() {
        DispatchQueue.main.async {
            self.notes = PersistenceProvider.default.shitNotes ?? []
        }
    }
    
}
