//
//  ViewController.swift
//  GitHub Hotest
//
//  Created by Daniel Warner on 2/20/16.
//  Copyright © 2016 Daniel Warner. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    var reposSearchUrl = DataService.languageReposSearchUrl
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func goButtonPressed(sender: AnyObject) {
        if let language = textField.text where language != "" {
            
            var requestUrl=reposSearchUrl
            requestUrl.appendContentsOf(language.lowercaseString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()))
            
            performSegueWithIdentifier("repoListVC", sender: requestUrl)
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "repoListVC" {
            
            if let repoListVC = segue.destinationViewController as? RepoListVC {
                
                if let requestUrl = sender as? String {
                    
                    repoListVC.requestUrl = requestUrl
                    repoListVC.language = textField.text
                }
            }
        }
    }
    

}

