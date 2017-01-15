//
//  UpdateCellView.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-14.
//  Copyright © 2017 Abegael Jackson. All rights reserved.
//

import Cocoa

enum UpdateCellStyle {
    case `default`
    case coding
    case userStory
}

protocol UpdateCellViewProtocol {
    
    func saveButtonTapped()
    func deleteButtonTapped()
}

class UpdateCellView: NSView {
    
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
    
    var cellStyle: UpdateCellStyle = UpdateCellStyle.default
    var delegate: UpdateCellViewProtocol?
    
    
    // MARK: -Set Up
    
    func setUpDefaultCell(with entry: WorkLogEntryType, delegate: UpdateCellViewProtocol) {
        
        self.delegate = delegate
        
        setUpWorkLogEntryFields(entry)
    }
    
    func setUpCodingCell(with entry: CodingWorkEntry, delegate: UpdateCellViewProtocol) {
        
        self.delegate = delegate

        cellStyle = UpdateCellStyle.coding
        setUpCodingEntryFields(entry)
        setUpWorkLogEntryFields(entry)
    }
    
    func setUpUserStoryCell(with entry: UserStoryEntry, delegate: UpdateCellViewProtocol) {
        
        self.delegate = delegate
        
        cellStyle = UpdateCellStyle.userStory
        setUpUserStoryEntryFields(entry)
        setUpCodingEntryFields(entry)
        setUpWorkLogEntryFields(entry)
    }
    
    
    // MARK: Helpers
    
    private func setUpWorkLogEntryFields(_ entry: WorkLogEntryType) {
        
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
        
        delegate?.saveButtonTapped()
    }
    
    @IBAction func deleteButtonTapped(_ sender: NSButton) {
        
        delegate?.deleteButtonTapped()
    }
}
