//
//  PopularCollectionViewCell.swift
//  spectare
//
//  Created by thaxz on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "popularCell"
    
    @IBOutlet var ivFilm: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    
    func setup(title: String, image: UIImage) {
        
        lbTitle.text = title
        ivFilm.image = image
        
    }
    
}
