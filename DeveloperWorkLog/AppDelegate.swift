//
//  AppDelegate.swift
//  DeveloperWorkLog
//
//  Created by Abegael Jackson on 2017-01-12.
//  Copyright © 2017 Abegael Jackson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var popover = NSPopover()
    var statusItem: NSStatusItem?
    var darkModeOn: Bool = false


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusItem?.toolTip = "Developer Work Log"
        
        if let button = statusItem?.button {
            button.action = #selector(togglePopover)
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
            button.image = Image(asset: Asset.bookIcon)
        }
        
        popover.behavior = .transient
        
        let storyboard = NSStoryboard.init(name: "Main", bundle: Bundle.main)
        if let workLogVC = storyboard.instantiateController(withIdentifier: "workLogVC") as? WorkLogVC {
            popover.contentViewController = workLogVC
        }
        
    }

    
    // MARK: Helpers
    
    @objc func togglePopover() {
        
        if popover.isShown {
            popover.close()
        }
        else {
            if let button = statusItem?.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}

