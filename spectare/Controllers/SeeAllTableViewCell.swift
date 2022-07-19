//
//  SeeAllTableViewCell.swift
//  spectare
//
//  Created by thaxz on 18/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {

    @IBOutlet var ivPoster: UIImageView!
    @IBOutlet var lbRating: UILabel!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
