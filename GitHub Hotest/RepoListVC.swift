//
//  RepoListVC.swift
//  GitHub Hotest
//
//  Created by Daniel Warner on 2/20/16.
//  Copyright © 2016 Daniel Warner. All rights reserved.
//

import UIKit
import Alamofire

class RepoListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var repoListTitle: UILabel!
    
    var language: String!
    var repositories = [Repository]()
    private var _requestUrl: String?
    
    var requestUrl: String {
        get {
            if _requestUrl != nil {
                return _requestUrl!
            } else {
                return ""
            }
            
        }
        set {
            _requestUrl = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        repoListTitle.text = "\(language) repositories"
        downloadReposData()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var repo: Repository
        repo = repositories[indexPath.row]
        performSegueWithIdentifier("repoDetailVC", sender: repo)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("RepoCell") as? RepoCell {
            
            let repo = repositories[indexPath.row]
            cell.configureCell(repo)
            return cell
            
        } else {
            return RepoCell()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "repoDetailVC" {
            
            if let repoDetailVC = segue.destinationViewController as? RepoDetailVC {
                
                if let repo = sender as? Repository {
                    
                    repoDetailVC.repository = repo
                }
            }
        }

    }
    
    
    func downloadReposData() {
        
        Alamofire.request(.GET, requestUrl)
            .responseJSON { response in
                if let items = response.result.value as? Dictionary<String, AnyObject> {
                    var itemsArray = items["items"] as? Array<AnyObject>
                    for var x = 0 ; x < itemsArray!.count ; x++ {
                        if let repo = itemsArray![x] as? AnyObject {
                            let repoName = repo["name"] as? String
                            let repoDescription = repo["description"] as? String
                            let contributorsUrl = repo["contributors_url"] as? String
                            let issuesUrl = repo["issues_url"] as? String
                            if let owner = repo["owner"] {
                                let author = owner!["login"] as? String
                                let avatarUrl = owner!["avatar_url"] as? String
                                let repo = Repository(name: repoName!, avatarUrl: avatarUrl!, description: repoDescription!, author: author!, contributorsUrl: contributorsUrl!, issuesUrl: issuesUrl!)
                                self.repositories.append(repo)
                            }
                        }
                    }
                }
          self.tableView.reloadData()
        }
    }

}

