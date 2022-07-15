//
//  DetailsViewController.swift
//  spectare
//
//  Created by thaxz on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    
    @IBOutlet var ivBackdrop: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var ivPoster: UIImageView!
    @IBOutlet var lbRating: UILabel!
    @IBOutlet var lbOverview: UILabel!
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        guard let movie = movie else {return}

        self.title = movie.title
        ivBackdrop.image = UIImage(named: movie.backdrop)
        lbTitle.text = movie.title
        ivPoster.image = UIImage(named: movie.poster)
        lbRating.text = "Rating: \(movie.voteAverage)/10"
        lbOverview.text = movie.overview
       
    }
    

}
