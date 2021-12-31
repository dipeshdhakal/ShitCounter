//
//  Strings.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 19/12/21.
//

import Foundation

enum ShitLogString: String {
    case tabName = "Shit Log"
    case navTitle = "Shit Counter"
    case goalPrefix = "Goal: "
    case today = "Today"
    case week = "Week"
    case overall = "Overall"
    
    // Add Shit View
    case addShitTitle = "Are you sure you want to your your Shit?"
    case addShitDate = "Shit Date"
    case addShitNote = "Anything speciall about this shit to note?"
    case addShitButton = "Log Shit"
    
    // Set Shit widget
    case addShitWidgetTitle = "Set your Shit goal before starting to log your shit"
    case addShitWidgetDetails = "Lets get Started!"
    
    // Shit Config
    case shitConfigDelete = "Delete"
    case shitConfigCancel = "Cancel"
    case shitConfigStartDate = "Start Date"
    case shitConfigEndDate = "End Date"
    case shitConfigNavTitle = "Configure Shit"
    case shitConfigDateSection = "Shit tracking period"
    case shitConfigGoalSection = "Shit Goal"
    case shitConfigGoalPlaceholder = "Estimated number of shits"
    case shitConfigButton = "Save"
    case shitConfigDeleteTitle = "Are you sure?"
    case shitConfigDeleteMessage = "All your current logs will be deleted and you will have to start all over again."
    
}


enum ShitNotesString: String {
    case tabName = "Shit Notes"
    case addNoteNavTitle = "Add / Update Note"
    case addNoteDelete = "Delete"
    case addNoteCancel = "Cancel"
    case addNoteTitle = "Note Title"
    case addNoteDetail = "Note Details"
    case addNoteButton = "Save Note"
    case addNoteDetails = "Some of the great thoughts come when you shit. Add a note before they go away!!!"
    
    case noteDetailsPlaceholder = " Enter note details"
    case deleteConfirmTitle = "Are you sure you want to delete this note?"
}

enum SettingString: String {
    case navTitle = "Settings"
    case notificationTitle = "Notification"
    case notificationSection = "Notification Setting"
    case shitSettingSection = "Shit Configuration"
    case addShit = "Add Shit"
    case editShit = "Edit Shit"
}
