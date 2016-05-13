//
//  NoteController.swift
//  UnitOneCodeChallenge
//
//  Created by Sean Gilhuly on 5/13/16.
//  Copyright © 2016 Sean Gilhuly. All rights reserved.
//

import Foundation

class NoteController {
    
    static let sharedController = NoteController()
    
    var notes: [Note]
    
    init() {
        self.notes = []
    }
    
    
    func addNote(note: Note) {
        notes.append(note)
    }
    
    
    func removeNote(note: Note) {
        
        
        
    }
    
    
    
    
    
    
    
    
}