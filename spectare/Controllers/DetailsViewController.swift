//
//  DetailsViewController.swift
//  spectare
//
//  Created by thaxz on 13/07/22.
//

import UIKit

// MARK: - Controller of "Details" screen

class DetailsViewController: UIViewController {

    // Storing and instantiating what we are going to get from API
    
    var movie: Movie?
    
    // Outlets from Storyboard
    
    @IBOutlet var ivBackdrop: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var ivPoster: UIImageView!
    @IBOutlet var lbRating: UILabel!
    @IBOutlet var lbOverview: UILabel!
    @IBOutlet var lbGenres: UILabel!
    @IBOutlet var lbRuntime: UILabel!
    
    // MARK: - View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        guard let movie = movie else {return}

        self.title = movie.title
        
        Task {
            
            // Getting runtime
            
            let data = await Movie.detailsMoviesAPI(Int(movie.id ))
            lbRuntime.text = "\(String(data.runtime/60))h \(String(data.runtime%60)) min."
            
            // Getting genres
            
            let genres = data.genres.map { genre in
                return genre.name
            }
            var aux = ""
            
            for i in 0...genres.count - 1 {
                if i == genres.count - 1 {
                    aux += genres[i]
                } else {
                    aux += genres[i] + ", \n"
                }
            }
            
            lbGenres.text = aux
            
            // Getting Backdrop image
            
            let backdropImage = await Movie.downloadImageData(withPath: movie.backdropPath ?? "")
            let imageBackdrop = UIImage(data: backdropImage) ?? UIImage()
            self.ivBackdrop.image = imageBackdrop
            
            // Getting Poster image
            
            let posterImage = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
            let imagePoster = UIImage(data: posterImage)
            self.ivPoster.image = imagePoster
            
        }
        
        // Setting up cell
        
        ivBackdrop.image = UIImage(named: movie.backdropPath ?? "")
        lbTitle.text = movie.title
        ivPoster.image = UIImage(named: movie.posterPath ?? "")
        let votingRounded: Float = round(movie.voteAverage*10)/10
        lbRating.text = "Rating: \(votingRounded)/10"
        lbOverview.text = movie.overview
    
    }
    
    // Moving data to Details screen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let posterViewController = segue.destination as? PosterViewController else { return }
        
        posterViewController.photoPoster = ivPoster.image!
        posterViewController.filmTitle = movie!.title
        
        // Hidding tabBar
        
        hidesBottomBarWhenPushed = true
        
    }
    
    // MARK: - Perfoming Segue

    @IBAction func goToPicture(_ sender: UIButton) {
        performSegue(withIdentifier: "posterSegue", sender: Any?.self)
    }
}
