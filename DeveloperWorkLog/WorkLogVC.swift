//
//  WorkLogVC.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-13.
//  Copyright © 2017 Abbey Jackson. All rights reserved.
//

import Cocoa

typealias CellActionType = ((NSTableCellView) -> Void)?

class WorkLogVC: NSViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var headerView: NSView!
    @IBOutlet weak var userStoryButton: NSButton!
    @IBOutlet weak var codingButton: NSView!
    @IBOutlet weak var nonCodingButton: NSButton!
    @IBOutlet weak var newEntryDismissButton: NSButton!
    
    var newEntryView = UpdateCell()
    

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNewEntryButtons(false)
    }
    

    // MARK: Actions
    
    @IBAction func userStoryTapped(_ sender: NSButton) {
        
        hideNewEntryButtons()
        newEntryDismissButton.isHidden = false
        
        if let updateCellView = NSNib.loadNSView(for: "UpdateUserStoryCellView", owner: newEntryView) as? UpdateCell {
            newEntryView = updateCellView
            newEntryView.deleteButton.isHidden = true
            newEntryView.deleteButton.isEnabled = false
            showNewEntryView()
        }
    }
    
    @IBAction func codingTapped(_ sender: NSButton) {
        
        hideNewEntryButtons()
        newEntryDismissButton.isHidden = false
        
        if let updateCellView = NSNib.loadNSView(for: "UpdateCodingCellView", owner: newEntryView) as? UpdateCell {
            newEntryView = updateCellView
            newEntryView.deleteButton.isHidden = true
            newEntryView.deleteButton.isEnabled = false
            showNewEntryView()
        }
    }
    
    @IBAction func nonCodingTapped(_ sender: NSButton) {
        
        hideNewEntryButtons()
        newEntryDismissButton.isHidden = false
        
        if let updateCellView = NSNib.loadNSView(for: "UpdateNonCodingCellView", owner: newEntryView) as? UpdateCell {
            newEntryView = updateCellView
            newEntryView.deleteButton.isHidden = true
            newEntryView.deleteButton.isEnabled = false
            showNewEntryView()
        }
    }
    
    @IBAction func newEntryDismissButtonTapped(_ sender: NSButton) {
        
        newEntryView.removeFromSuperview()
        hideNewEntryButtons(false)
    }
    
    
    
    // MARK: Helpers
    
    func showNewEntryView() {
        
        headerView.addSubview(newEntryView)
        newEntryView.topAnchor.constraint(equalTo: headerView.topAnchor)
        newEntryView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor)
        newEntryView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
        newEntryView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor)
    }
    
    func hideNewEntryButtons(_ isHidden: Bool = true) {
        
        userStoryButton.isHidden = isHidden
        codingButton.isHidden = isHidden
        nonCodingButton.isHidden = isHidden
        
        newEntryDismissButton.isHidden = !isHidden
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
