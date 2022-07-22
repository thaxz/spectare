//
//  PopularCollectionViewCell.swift
//  spectare
//
//  Created by thaxz on 11/07/22.
//

import UIKit

// MARK: - Class of "Popular" collectionView's cell

class PopularCollectionViewCell: UICollectionViewCell {
    
    // Storing cell identifier
    
    static let cellIdentifier = "popularCell"
    
    // Outlets from storyboard
    
    @IBOutlet var ivFilm: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    
    // Setting up cell
    
    func setup(title: String, image: UIImage) {
        
        lbTitle.text = title
        ivFilm.image = image
        self.ivFilm.layer.cornerRadius = 8
        
    }
}
