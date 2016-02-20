//
//  ViewController.swift
//  GitHub Hotest
//
//  Created by Daniel Warner on 2/20/16.
//  Copyright © 2016 Daniel Warner. All rights reserved.
//

import UIKit
import Alamofire

class InputViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var reposSearchUrl = DataService.languageReposSearchUrl;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func performLanguageRequest(sender: AnyObject) {
        if let language = textField.text {
            reposSearchUrl.appendContentsOf(language)
            print(reposSearchUrl)
            
            
            Alamofire.request(.GET, reposSearchUrl)
                .responseJSON { response in
                    if let dict = response.result.value as? Dictionary<String, AnyObject> {
                        print(dict.debugDescription)
                    }
            }
        }
    }
    

}

