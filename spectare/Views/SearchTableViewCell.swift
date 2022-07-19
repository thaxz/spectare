//
//  SearchTableViewCell.swift
//  spectare
//
//  Created by thaxz on 19/07/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    
    @IBOutlet var ivPoster: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbDate: UILabel!
    
    func setup(title: String, image: UIImage, year: String) {
        
        ivPoster.image = image
        lbTitle.text = title
        lbDate.text = year
        self.ivPoster.layer.cornerRadius = 8
        
    }
    

}
