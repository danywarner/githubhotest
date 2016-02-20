//
//  Issue.swift
//  GitHub Hotest
//
//  Created by Daniel Warner on 2/20/16.
//  Copyright © 2016 Daniel Warner. All rights reserved.
//

import Foundation

class Issue {
    
    var _user: String
    var _title: String
    var _description: String
    var _date: String
    
    init(user: String, title: String, description: String, date: String) {
        _user = user
        _title = title
        _description = description
        _date = date
    }
}