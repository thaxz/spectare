//
//  NowPlayingCollectionViewCell.swift
//  spectare
//
//  Created by thaxz on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var ivFilm: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbDate: UILabel!
    
    func setup(title: String, image: UIImage, date: String) {
        
        lbTitle.text = title
        ivFilm.image = image
        lbDate.text = date
        self.ivFilm.layer.cornerRadius = 8
        
    }
    
    
}
