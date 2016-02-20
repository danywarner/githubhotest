//
//  Repository.swift
//  GitHub Hotest
//
//  Created by Daniel Warner on 2/20/16.
//  Copyright © 2016 Daniel Warner. All rights reserved.
//

import Foundation


class Repository {
    
    private var _name: String
    private var _avatarUrl: String
    private var _description: String
    private var _author: String
    private var _top3contributors: [String]?
    private var _latest3issues: [Issue]?
    
    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    var description: String {
        get {
            return _description
        }
        set {
            _description = newValue
        }
    }
    
    var author: String {
        get {
            return _author
        }
        set {
            _author = newValue
        }
    }
    
    var avatarUrl: String {
        get {
            return _avatarUrl
        }
        set {
            _avatarUrl = newValue
        }
    }
    
    var top3contributors: [String] {
        get {
            if _top3contributors != nil {
                return _top3contributors!
            } else {
                return [String]()
            }
            
        }
        set {
            _top3contributors = newValue
        }
    }
    
    var latest3issues: [Issue] {
        get {
            if _latest3issues != nil {
                return _latest3issues!
            } else {
                return [Issue]()
            }
            
        }
        set {
            _latest3issues = newValue
        }
    }
    
    
    init(name: String, avatarUrl: String, description: String, author: String) {
        _name = name
        _avatarUrl = avatarUrl
        _description = description
        _author = author
    }
    
    
    
    
    
}