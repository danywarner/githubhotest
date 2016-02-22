//
//  RepoDetailVC.swift
//  GitHub Hotest
//
//  Created by Daniel Warner on 2/21/16.
//  Copyright © 2016 Daniel Warner. All rights reserved.
//

import UIKit
import Alamofire

class RepoDetailVC: UIViewController {

    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var contributor1Lbl: UILabel!
    @IBOutlet weak var contributor2Lbl: UILabel!
    @IBOutlet weak var contributor3Lbl: UILabel!
    @IBOutlet weak var issue1Lbl: UILabel!
    @IBOutlet weak var issue2Lbl: UILabel!
    @IBOutlet weak var issue3Lbl: UILabel!

    
    
    
    private var _repository: Repository?
    
    var repository: Repository {
        get {
           return _repository!
        }
        set {
            _repository = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelsTexts()
        downloadContributors()
        downloadIssues()
        // Do any additional setup after loading the view.
    }
    
    func setLabelsTexts() {
        repoNameLbl.text = repository.name
        descriptionLbl.text = repository.repoDescription
        authorLbl.text = repository.author
        
    }
    
    func downloadContributors() {
        Alamofire.request(.GET, repository.contributorsUrl).responseJSON { response in
            
                if let contributors = response.result.value as? Array<AnyObject> {
                    let contributor1 = contributors[0]["login"] as? String
                    let contributor2 = contributors[1]["login"] as? String
                    let contributor3 = contributors[2]["login"] as? String
                    self.contributor1Lbl.text = contributor1!
                    self.contributor2Lbl.text = contributor2!
                    self.contributor3Lbl.text = contributor3!
                }
        }
    }
    
    func downloadIssues() {
        let g = "{/number}"
        let issuesUrl = repository.issuesUrl
        let range = issuesUrl.rangeOfString(g)!
        let intIndex: Int = issuesUrl.startIndex.distanceTo(range.startIndex)
        let index1 = issuesUrl.startIndex.advancedBy(intIndex)
        let newString = issuesUrl.substringToIndex(index1)
        //newString.appendContentsOf("?q=sort: created")
        
        Alamofire.request(.GET, newString).responseJSON { response in
            
            if let issues = response.result.value as? Array<AnyObject> {
                if issues.count >= 1 {
                    let issue1 = issues[0]["title"] as? String
                    self.issue1Lbl.text = issue1
                } else {
                    self.issue1Lbl.text = ""
                }
                
                
                if issues.count >= 2 {
                    let issue2 = issues[1]["title"] as? String
                    self.issue2Lbl.text = issue2
                } else {
                    self.issue2Lbl.text = ""
                }
                
                if issues.count >= 3 {
                    let issue3 = issues[2]["title"] as? String
                    self.issue3Lbl.text = issue3
                } else {
                    self.issue3Lbl.text = ""
                }
                
                
                
            }
        }
    }

    
}
