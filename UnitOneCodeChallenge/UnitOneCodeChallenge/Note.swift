//
//  Note.swift
//  UnitOneCodeChallenge
//
//  Created by Sean Gilhuly on 5/13/16.
//  Copyright © 2016 Sean Gilhuly. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private let timeStampKey = "timeStamp"
    private let titleKey = "titleKey"
    private let bodyTextKey = "bodyText"
    
    var timeStamp: NSDate
    var title: String
    var bodyText: String
    
    var dictionaryCopy: [String: AnyObject] {
        return [timeStampKey: timeStamp, titleKey: title, bodyTextKey: bodyText]
    }
    
    init(timeStamp: NSDate, title: String, bodyText: String) {
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let timeStamp = dictionary[timeStampKey] as? NSDate,
            let title = dictionary[titleKey] as? String,
            let bodyText = dictionary[bodyTextKey] as? String else {
                return nil
            }
            self.timeStamp = timeStamp
            self.title = title
            self.bodyText = bodyText
        }
    }

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.timeStamp == rhs.timeStamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}