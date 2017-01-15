//
//  WorkLogEntryType.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-14.
//  Copyright © 2017 Abbey Jackson. All rights reserved.
//

import Cocoa

class WorkLogEntryType: NSObject {
    
    var workDescription: String
    var notes: String?
    var addedValue: Bool?
    
    
    init(workDescription: String, notes: String?, addedValue: Bool?) {

        self.workDescription = workDescription
        self.notes = notes
        self.addedValue = addedValue
    }
}
