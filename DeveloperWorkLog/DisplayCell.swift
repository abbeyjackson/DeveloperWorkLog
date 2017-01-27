//
//  DisplayCell.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-15.
//  Copyright © 2017 Abegael Jackson. All rights reserved.
//

import Cocoa

class DisplayCell: NSTableCellView {
    
    // MARK: Properties
    
    @IBOutlet weak var storyNumberLabel: NSTextField!
    @IBOutlet weak var workDescriptionLabel: NSTextField!
    @IBOutlet weak var storyPoints: NSTextField!
    @IBOutlet weak var notesLabel: NSTextField!
    @IBOutlet weak var refactoringCheckBox: NSButton!
    @IBOutlet weak var majorBugCheckBox: NSButton!
    @IBOutlet weak var addedValueCheckBox: NSButton!
    
    @IBOutlet weak var editButton: NSButton!
    
    var cellStyle: CellStyle = CellStyle.nonCoding
    var editAction: CellActionType = CellActionType.none
    
    
    // MARK: -Set Up
    
    func setUpDefaultCell(with entry: WorkLogEntryType, editAction: CellActionType) {
        
        self.editAction = editAction
        
        setUpWorkLogEntryFields(entry)
    }
    
    func setUpCodingCell(with entry: CodingWorkEntry, editAction: CellActionType) {
        
        self.editAction = editAction
        
        cellStyle = CellStyle.coding
        setUpCodingEntryFields(entry)
        setUpWorkLogEntryFields(entry)
    }
    
    func setUpUserStoryCell(with entry: UserStoryEntry, editAction: CellActionType) {
        
        self.editAction = editAction
        
        cellStyle = CellStyle.userStory
        setUpUserStoryEntryFields(entry)
        setUpCodingEntryFields(entry)
        setUpWorkLogEntryFields(entry)
    }
    
    
    // MARK: Helpers
    
    private func setUpWorkLogEntryFields(_ entry: WorkLogEntryType) {
        
        workDescriptionLabel.stringValue = entry.workDescription
        notesLabel.stringValue = entry.notes ?? ""
        addedValueCheckBox.isEnabled = entry.addedValue ?? false
    }
    
    private func setUpCodingEntryFields(_ entry: CodingWorkEntry) {
        
        refactoringCheckBox.isEnabled = entry.requiredRefactoring ?? false
        majorBugCheckBox.isEnabled = entry.hadMajorBug ?? false
    }
    
    private func setUpUserStoryEntryFields(_ entry: UserStoryEntry) {
        
        storyNumberLabel.intValue = Int32(entry.storyNumber)
    }
    
    
    // MARK: Actions
    
    @IBAction func editButtonTapped(_ sender: NSButton) {
        
        editAction?(self)
    }
}
