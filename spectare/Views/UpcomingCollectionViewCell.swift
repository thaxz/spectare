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
    
    func setup(title: String, image: UIImage, date: String) {
        
        lbTitle.text = title
        ivFilm.image = image
        lbDate.text = convertDate(date: String(date.suffix(5)))
        self.ivFilm.layer.cornerRadius = 8
        
        
    }
    
    func convertDate(date: String) -> String {
        return (monthNumToName[String(date.prefix(3))] ?? "") + String(date.suffix(2))
    }
    
}
