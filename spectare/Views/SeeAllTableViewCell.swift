//
//  SeeAllTableViewCell.swift
//  spectare
//
//  Created by thaxz on 18/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "cell"

    @IBOutlet var ivPoster: UIImageView!
    @IBOutlet var lbRating: UILabel!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbYear: UILabel!
    
    func setup(title: String, rating: String, image: UIImage, year: String) {
        
        ivPoster.image = image
        lbRating.text = rating
        lbTitle.text = title
        lbYear.text = year
        self.ivPoster.layer.cornerRadius = 8
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
