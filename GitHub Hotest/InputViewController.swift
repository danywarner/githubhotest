//
//  ViewController.swift
//  GitHub Hotest
//
//  Created by Daniel Warner on 2/20/16.
//  Copyright © 2016 Daniel Warner. All rights reserved.
//

import UIKit
import Alamofire

class InputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var errorLbl: UILabel!
    private var reposSearchUrl = DataService.languageReposSearchUrl
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    

    override func viewWillAppear(animated: Bool) {
        errorLbl.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        goButtonPressed(textField)
        view.endEditing(true)
        return false
    }
    
    @IBAction func goButtonPressed(sender: AnyObject) {
        if let language = textField.text where language != "" {
            
            var requestUrl=reposSearchUrl
            requestUrl.appendContentsOf(language.lowercaseString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()))
            
            //Perform the request in order to print an error in case the response is an error due to an unexistent programming language
            Alamofire.request(.GET, requestUrl)
                .responseJSON { response in
                    if let items = response.result.value as? Dictionary<String, AnyObject> {
                        if  items["items"] as? Array<AnyObject> != nil {
                            self.performSegueWithIdentifier("repoListVC", sender: requestUrl)
                        } else {
                            self.errorLbl.text = "No results were found!"
                        }
                    }
            }
        }
        
    }
    
    
    //passing the programming language as well as the request GET URL for the segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "repoListVC" {
            
            if let repoListVC = segue.destinationViewController as? RepoListVC {
                
                if let requestUrl = sender as? String {
                    
                    repoListVC.requestUrl = requestUrl
                    repoListVC.language = textField.text!
                }
            }
        }
    }
    

}

