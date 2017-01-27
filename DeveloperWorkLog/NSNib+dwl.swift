//
//  NSNib+dwl.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-14.
//  Copyright © 2017 Abegael Jackson. All rights reserved.
//

import Cocoa

extension NSNib {

    class func loadNSView(for name: String, owner: Any) -> NSView? {
        var topLevelObjects = NSArray()
        if Bundle.main.loadNibNamed(name, owner: owner, topLevelObjects: &topLevelObjects) {
            let views = (topLevelObjects as Array).filter { $0 is NSView }
            return views[0] as? NSView
        }
        else { return nil }
    }
}
