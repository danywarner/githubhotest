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
    private var _repoDescription: String
    private var _author: String
    private var _contributorsUrl: String
    private var _issuesUrl: String
    
    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    var repoDescription: String {
        get {
            return _repoDescription
        }
        set {
            _repoDescription = newValue
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
    
    var contributorsUrl: String {
        get {
            return _contributorsUrl
        }
        set {
            _contributorsUrl = newValue
        }
    }
    
    var issuesUrl: String {
        get {
            return _issuesUrl
            
        }
        set {
            _issuesUrl = newValue
        }
    }
    
    
    init(name: String, avatarUrl: String, description: String, author: String, contributorsUrl: String, issuesUrl: String) {
        _name = name
        _avatarUrl = avatarUrl
        _repoDescription = description
        _author = author
        _contributorsUrl = contributorsUrl
        _issuesUrl = issuesUrl
    }
    
    
    
    
    
}