//
//  RepoCell.swift
//  GitHub Hotest
//
//  Created by Daniel Warner on 2/20/16.
//  Copyright © 2016 Daniel Warner. All rights reserved.
//

import UIKit
import Alamofire

class RepoCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var repoNameLbl: UILabel!
    
   
    func configureCell(repo: Repository) {
        repoNameLbl.text = repo.name
        //print("configuring....\(repo.name)")
        Alamofire.request(.GET, repo.avatarUrl).response(completionHandler: {
            request, response, data, err in
            
            if err == nil {
                if let img = UIImage(data: data!) {
                    self.avatar.image = img
                    self.avatar.layer.cornerRadius = self.avatar.frame.size.width / 2
                    self.avatar.clipsToBounds = true
                    //repo.image = data
                }
            }
        })
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
