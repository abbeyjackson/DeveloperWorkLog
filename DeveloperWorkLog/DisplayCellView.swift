//
//  DisplayCellView.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-15.
//  Copyright © 2017 Abegael Jackson. All rights reserved.
//

import Cocoa

protocol DisplayCellViewProtocol {
    
    func editButtonTapped()
}

class DisplayCellView: NSView {
    
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
    var delegate: DisplayCellViewProtocol?
    
    
    // MARK: -Set Up
    
    func setUpDefaultCell(with entry: WorkLogEntryType, delegate: DisplayCellViewProtocol) {
        
        self.delegate = delegate
        
        setUpWorkLogEntryFields(entry)
    }
    
    func setUpCodingCell(with entry: CodingWorkEntry, delegate: DisplayCellViewProtocol) {
        
        self.delegate = delegate
        
        cellStyle = CellStyle.coding
        setUpCodingEntryFields(entry)
        setUpWorkLogEntryFields(entry)
    }
    
    func setUpUserStoryCell(with entry: UserStoryEntry, delegate: DisplayCellViewProtocol) {
        
        self.delegate = delegate
        
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
        
        delegate?.editButtonTapped()
    }
}
