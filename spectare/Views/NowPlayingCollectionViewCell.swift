//
//  NowPlayingCollectionViewCell.swift
//  spectare
//
//  Created by thaxz on 11/07/22.
//

import UIKit

// MARK: - Class of "NowPlaying" collectionView's cell

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    // Storing cell identifier
    
    static let cellIdentifier = "nowPlayingCell"
    
    // Outlets from storyboard
    
    @IBOutlet var ivFilm: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbDate: UILabel!
    
    // Setting up cell
    
    func setup(title: String, image: UIImage, date: String) {
        
        lbTitle.text = title
        ivFilm.image = image
        lbDate.text = date
        self.ivFilm.layer.cornerRadius = 8
        
    }
}
