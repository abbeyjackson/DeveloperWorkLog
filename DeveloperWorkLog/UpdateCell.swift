//
//  UpdateCell.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-14.
//  Copyright © 2017 Abegael Jackson. All rights reserved.
//

import Cocoa

enum CellStyle {
    case nonCoding
    case coding
    case userStory
}

class UpdateCell: NSTableCellView {
    
    // MARK: Properties

    @IBOutlet weak var storyNumberTextField: NSTextField!
    @IBOutlet weak var workDescriptionTextField: NSTextField!
    @IBOutlet weak var storyPoints: NSTextField!
    @IBOutlet weak var notesTextField: NSTextField!
    @IBOutlet weak var refactoringCheckBox: NSButton!
    @IBOutlet weak var majorBugCheckBox: NSButton!
    @IBOutlet weak var addedValueCheckBox: NSButton!
    
    @IBOutlet weak var saveButton: NSButton!
    @IBOutlet weak var deleteButton: NSButton!
    
    var cellStyle: CellStyle = CellStyle.nonCoding
    var saveAction: CellActionType = CellActionType.none
    var deleteAction: CellActionType = CellActionType.none
    
    // MARK: -Set Up
    
    func setUpDefaultCell(with entry: WorkLogEntry, saveAction: CellActionType, deleteAction: CellActionType) {
        
        self.saveAction = saveAction
        self.deleteAction = deleteAction
        
        setUpWorkLogEntryFields(entry)
    }
    
    func setUpCodingCell(with entry: CodingWorkEntry, saveAction: CellActionType, deleteAction: CellActionType) {
        
        self.saveAction = saveAction
        self.deleteAction = deleteAction

        cellStyle = CellStyle.coding
        setUpCodingEntryFields(entry)
        setUpWorkLogEntryFields(entry)
    }
    
    func setUpUserStoryCell(with entry: UserStoryEntry, saveAction: CellActionType, deleteAction: CellActionType) {
        
        self.saveAction = saveAction
        self.deleteAction = deleteAction
        
        cellStyle = CellStyle.userStory
        setUpUserStoryEntryFields(entry)
        setUpCodingEntryFields(entry)
        setUpWorkLogEntryFields(entry)
    }
    
    
    // MARK: Helpers
    
    private func setUpWorkLogEntryFields(_ entry: WorkLogEntry) {
        
        workDescriptionTextField.stringValue = entry.workDescription
        notesTextField.stringValue = entry.notes ?? ""
        addedValueCheckBox.isEnabled = entry.addedValue ?? false
    }
    
    private func setUpCodingEntryFields(_ entry: CodingWorkEntry) {
        
        refactoringCheckBox.isEnabled = entry.requiredRefactoring ?? false
        majorBugCheckBox.isEnabled = entry.hadMajorBug ?? false
    }
    
    private func setUpUserStoryEntryFields(_ entry: UserStoryEntry) {
        
        storyNumberTextField.intValue = Int32(entry.storyNumber)
    }
    
    
    // MARK: Actions
    
    @IBAction func saveButtonTapped(_ sender: NSButton) {
        
        saveAction?(self)
    }
    
    @IBAction func deleteButtonTapped(_ sender: NSButton) {
        
        deleteAction?(self)
    }
}
