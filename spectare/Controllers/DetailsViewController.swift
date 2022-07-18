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
        
        Task {
            // baixar imagem do backdrop
            let backdropImage = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imageBackdrop = UIImage(data: backdropImage) ?? UIImage()
            self.ivBackdrop.image = imageBackdrop
            // baixar imagem do poster
            let posterImage = await Movie.downloadImageData(withPath: movie.posterPath)
            let imagePoster = UIImage(data: posterImage)
            self.ivPoster.image = imagePoster
            
        }
        
        ivBackdrop.image = UIImage(named: movie.backdropPath)
        lbTitle.text = movie.title
        ivPoster.image = UIImage(named: movie.posterPath)
        lbRating.text = "Rating: \(movie.voteAverage)/10"
        lbOverview.text = movie.overview
       
    }
    

}
