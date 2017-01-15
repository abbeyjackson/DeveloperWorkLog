//
//  CodingWorkEntry.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-14.
//  Copyright © 2017 Abbey Jackson. All rights reserved.
//

import Cocoa

class CodingWorkEntry: WorkLogEntryType {
    
    var requiredRefactoring: Bool?
    var hadMajorBug: Bool?
    
    
    init(workDescription: String, notes: String?, requiredRefactoring: Bool?, hadMajorBug: Bool?, addedValue: Bool?) {
        
        self.requiredRefactoring = requiredRefactoring
        self.hadMajorBug = hadMajorBug
        
        super.init(workDescription: workDescription, notes: notes, addedValue: addedValue)
        
        self.workDescription = workDescription
        self.notes = notes
        self.addedValue = addedValue
    }
}
