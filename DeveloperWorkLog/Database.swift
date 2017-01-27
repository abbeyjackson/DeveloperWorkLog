//
//  Database.swift
//  DeveloperWorkLog
//
//  Created by Abbey Jackson on 2017-01-14.
//  Copyright © 2017 Abbey Jackson. All rights reserved.
//

import Cocoa

enum DatabaseError: Error {
    case notSaved
    case notMoved
}

class Database {

    // MARK: Properties
    
    private let store = UserDefaults.standard
    private var entries: [WorkLogEntryType] {
        get {
            if let entries = store.object(forKey: self.key) as? [WorkLogEntryType] {
                return entries
            }
            else {
                return [WorkLogEntryType]()
            }
        }
        set {
            store.setValue(newValue, forKey: key)
        }
    }
    
    private let key = "DeveloperWorkLog"
    
    var currentEntry: WorkLogEntryType?
    var currentIndex: Int?
    var newIndex: Int?
    
    static var shared = Database()
    
    
    // MARK: Initialization
    
    private init() {
        
    }
    
    
    // MARK: Functionality
    
    func add(_ entry: WorkLogEntryType) {

        entries.append(entry)
        
        store.set(entries, forKey: key)
    }
    
    func retrieveEntry(at index: Int) -> WorkLogEntryType? {
        
        if let entry = entries[safe: index] {
            currentIndex = index
            return entry
        }
        
        return nil
    }
    
    func retrieveAllEntries() -> [WorkLogEntryType] {
        
        return entries
    }
    
    func update(_ entry: WorkLogEntryType) throws {
        
        if let index = currentIndex {
            entries[index] = entry
        }
        else {
            throw DatabaseError.notSaved
        }
    }
    
    func deleteEntry(at index: Int) {
        
        entries.remove(at: index)
    }
    
    func deleteEntries(at indices: Int...) {
        
        let sortedIndices = indices.sorted() { $0 > $1 }
        
        for entry in sortedIndices.enumerated() {
            entries.remove(at: entry.element)
        }
    }
    
    func moveEntry(to index: Int) throws {
        
        newIndex = index
        
        guard let currentIndex = currentIndex, let newIndex = newIndex, let currentEntry = currentEntry else {
            throw DatabaseError.notMoved
        }
        
        if currentIndex > newIndex {
            deleteEntry(at: currentIndex)
            entries.insert(currentEntry, at: newIndex)
        }
        else {
            entries.insert(currentEntry, at: newIndex)
            deleteEntry(at: currentIndex)
        }
    }
}
