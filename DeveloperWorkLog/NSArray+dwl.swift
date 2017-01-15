//
//  NSArray+dwl.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-14.
//  Copyright © 2017 Abbey Jackson. All rights reserved.
//

import Cocoa

extension Array {
    
    public subscript(safe safe: Int) -> Element? {
        
        guard 0 <= safe && safe < count else { return nil }
        return self[safe]
    }
}
