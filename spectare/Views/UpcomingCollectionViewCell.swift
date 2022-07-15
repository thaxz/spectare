//
//  UpcomingCollectionViewCell.swift
//  spectare
//
//  Created by thaxz on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var ivFilm: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbDate: UILabel!
    
    func setup(title: String, image: UIImage, date: String) {
        
        lbTitle.text = title
        ivFilm.image = image
        lbDate.text = date
        
    }
    
}
