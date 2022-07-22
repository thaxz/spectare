//
//  TrendingTableViewCell.swift
//  spectare
//
//  Created by thaxz on 20/07/22.
//

import UIKit

// MARK: - Class of "Trending" tableView's cell

class TrendingTableViewCell: UITableViewCell {

    // Storing cell identifier
    
    static let cellIdentifier = "trendingCell"
    
    // Outlets from storyboard
    
    @IBOutlet var ivPoster: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbYear: UILabel!
    
    // Setting up cell
    
    func setup(title: String, image: UIImage, year: String) {
        
        ivPoster.image = image
        lbTitle.text = title
        lbYear.text = year
        self.ivPoster.layer.cornerRadius = 8
        
    }
}
