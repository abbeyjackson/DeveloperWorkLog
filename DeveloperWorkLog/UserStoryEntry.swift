//
//  UserStoryEntry.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-14.
//  Copyright © 2017 Abbey Jackson. All rights reserved.
//

import Cocoa

class UserStoryEntry: CodingWorkEntry {

    var storyNumber: Int
    var storyPoints: Int?
    
    
    init(storyNumber: Int, storyName: String, storyPoints: Int?, notes: String?, requiredRefactoring: Bool?, hadMajorBug: Bool?, addedValue: Bool?) {
        
        self.storyNumber = storyNumber
        self.storyPoints = storyPoints
        
        super.init(workDescription: storyName, notes: notes, requiredRefactoring: requiredRefactoring, hadMajorBug: hadMajorBug, addedValue: addedValue)
    
        self.workDescription = workDescription
        self.notes = notes
        self.requiredRefactoring = requiredRefactoring
        self.hadMajorBug = hadMajorBug
        self.addedValue = addedValue
        self.type = .userStory
    }
}
