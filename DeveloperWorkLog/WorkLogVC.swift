//
//  WorkLogVC.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-13.
//  Copyright © 2017 Abbey Jackson. All rights reserved.
//

import Cocoa

class WorkLogVC: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

}

extension WorkLogVC: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return "This is cell #\(row)"
    }
}

extension WorkLogVC: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.make(withIdentifier: "workLogCell", owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = "This is cell #\(row)"
            return cell
        }
        else { return nil }
    }
}

