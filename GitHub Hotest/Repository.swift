//
//  Repository.swift
//  GitHub Hotest
//
//  Created by Daniel Warner on 2/20/16.
//  Copyright © 2016 Daniel Warner. All rights reserved.
//

import Foundation


class Repository {
    
    var _name: String
    var _description: String
    var _author: String
    var _top3contributors: [String]?
    var _latest3issues: [Issue]?
    
    
    init(name: String, description: String, author: String) {
        _name = name
        _description = description
        _author = author
    }
    
}