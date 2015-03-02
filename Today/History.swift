//
//  History.swift
//  Today
//
//  Created by Roger Chen on 3/1/15.
//  Copyright (c) 2015 Roger Chen. All rights reserved.
//

import Foundation

class History
{

    var category: HistoryCategory
    var description: String
    var timestamp: NSDate

    init(category: HistoryCategory, description: String, timestamp: NSDate) {
        self.category = category
        self.description = description
        self.timestamp = timestamp
    }

}