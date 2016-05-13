//
//  Note.swift
//  UnitOneCodeChallenge
//
//  Created by Sean Gilhuly on 5/13/16.
//  Copyright © 2016 Sean Gilhuly. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    var timeStamp: NSDate
    var title: String
    var bodyText: String
    
    init(timeStamp: NSDate, title: String, bodyText: String) {
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
    
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.timeStamp == rhs.timeStamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}