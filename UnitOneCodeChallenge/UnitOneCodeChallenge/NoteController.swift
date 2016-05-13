//
//  NoteController.swift
//  UnitOneCodeChallenge
//
//  Created by Sean Gilhuly on 5/13/16.
//  Copyright © 2016 Sean Gilhuly. All rights reserved.
//

import Foundation

class NoteController {
    
    private let noteKey = "noteKey"
    
    static let sharedController = NoteController()
    
    var notes: [Note]
    
    init() {
        self.notes = []
    }
    
    
    func addNote(note: Note) {
        notes.append(note)
        
        saveToPersistentStorage()
    }
    
    
    func removeNote(note: Note) {
        guard let noteEntry = notes.indexOf(note) else {
            return
        }
        notes.removeAtIndex(noteEntry)
        
        saveToPersistentStorage()
    }
    
    // MARK: - PersistentStorage
    // MARK: Saving information to storage
    func saveToPersistentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(notes.map({$0.dictionaryCopy}), forKey: noteKey)
    }
    
    func loadFromPersistentStorage() {
        let enteredNotesFromStartOfApp = NSUserDefaults.standardUserDefaults().objectForKey(noteKey) as? [Dictionary<String, AnyObject>]
        
        if let enteredNotes = enteredNotesFromStartOfApp {
            
            self.notes = enteredNotes.map({Note(dictionary: $0)!})
        }
    }
    
    
    
}