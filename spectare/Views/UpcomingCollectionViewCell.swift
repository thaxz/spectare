//
//  UpcomingCollectionViewCell.swift
//  spectare
//
//  Created by thaxz on 11/07/22.
//

import UIKit

// MARK: - Class of "UpComing" collectionView's cell

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    // Storing cell identifier
    
    static let cellIdentifier = "upcomingCell"
    
    // Outlets from storyboard
    
    @IBOutlet var ivFilm: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbDate: UILabel!
    
    // Setting dictionary to convert date's format
    
    let monthNumToName = ["01-": "Jan ",
                          "02-": "Feb ",
                          "03-": "Mar ",
                          "04-": "Apr ",
                          "05-": "May ",
                          "06-": "Jun ",
                          "07-": "Jul ",
                          "08-": "Aug ",
                          "09-": "Sep ",
                          "10-": "Oct ",
                          "11-": "Nov ",
                          "12-": "Dec "]
    
    // Converting date's format
    
    func convertDate(date: String) -> String {
        return (monthNumToName[String(date.prefix(3))] ?? "") + String(date.suffix(2))
    }
    
    // Setting up cell
    
    func setup(title: String, image: UIImage, date: String) {
        
        lbTitle.text = title
        ivFilm.image = image
        lbDate.text = convertDate(date: String(date.suffix(5)))
        self.ivFilm.layer.cornerRadius = 20
    }
}
