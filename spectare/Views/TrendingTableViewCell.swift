//
//  TrendingTableViewCell.swift
//  spectare
//
//  Created by thaxz on 20/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    static let cellIdentifier = "trendingCell"
    
    @IBOutlet var ivPoster: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbYear: UILabel!
    
    func setup(title: String, image: UIImage, year: String) {
        
        ivPoster.image = image
        lbTitle.text = title
        lbYear.text = year
        self.ivPoster.layer.cornerRadius = 8
        
    }

}
