//
//  SearchTableViewCell.swift
//  spectare
//
//  Created by thaxz on 19/07/22.
//

import UIKit

// MARK: - Class of "Search" tableView's cell

class SearchTableViewCell: UITableViewCell {

    // Outlets from storyboard
    
    @IBOutlet var ivPoster: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbDate: UILabel!
    
    // Setting up cell
    
    func setup(title: String, image: UIImage, year: String) {
        
        ivPoster.image = image
        lbTitle.text = title
        lbDate.text = year
        self.ivPoster.layer.cornerRadius = 8
        
    }
}
