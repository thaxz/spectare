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
    @IBOutlet var lbGenres: UILabel!
    @IBOutlet var lbRuntime: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        guard let movie = movie else {return}

        self.title = movie.title
        
        Task {
            // Pegar duração
            let data = await Movie.detailsMoviesAPI(Int(movie.id ))
            lbRuntime.text = "\(String(data.runtime/60))h \(String(data.runtime%60)) min."
            // Pegar generos
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
            
            // baixar imagem do backdrop
            let backdropImage = await Movie.downloadImageData(withPath: movie.backdropPath ?? "")
            let imageBackdrop = UIImage(data: backdropImage) ?? UIImage()
            self.ivBackdrop.image = imageBackdrop
            // baixar imagem do poster
            let posterImage = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
            let imagePoster = UIImage(data: posterImage)
            self.ivPoster.image = imagePoster
            
        }
        

        
        ivBackdrop.image = UIImage(named: movie.backdropPath ?? "")
        lbTitle.text = movie.title
        ivPoster.image = UIImage(named: movie.posterPath ?? "")
        let votingRounded: Float = round(movie.voteAverage*10)/10
        lbRating.text = "Rating: \(votingRounded)/10"
        lbOverview.text = movie.overview
       
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let posterViewController = segue.destination as? PosterViewController else { return }
        
        posterViewController.photoPoster = ivPoster.image!
        posterViewController.filmTitle = movie!.title
        
        hidesBottomBarWhenPushed = true


        
    }

    @IBAction func goToPicture(_ sender: UIButton) {
        performSegue(withIdentifier: "posterSegue", sender: Any?.self)
    }
    
    
}
