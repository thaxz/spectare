//
//  SeeAllViewController.swift
//  spectare
//
//  Created by thaxz on 18/07/22.
//

import UIKit

class SeeAllViewController: UIViewController {
    
    @IBOutlet var seeAllTableView: UITableView!
    
    // Instanciando
    
    var seeAllMovies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DataSource e Delegate
        
        seeAllTableView.dataSource = self
        seeAllTableView.delegate = self
        
        
    }
    
    
    // Passando infos pela segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? DetailsViewController else { return }
        guard let movie = sender as? Movie else { return }
        detailsViewController.movie = movie
    }
    
    
}

// Delegate e DataSource

extension SeeAllViewController: UITableViewDelegate, UITableViewDataSource {
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return seeAllMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == seeAllTableView {
            
            let cell = seeAllTableView.dequeueReusableCell(withIdentifier: SeeAllTableViewCell.cellIdentifier, for: indexPath) as! SeeAllTableViewCell
            
            // Preenchendo a célula
            
            let movie = seeAllMovies[indexPath.item]
            
            cell.setup(title: movie.title,
                       rating: String(movie.voteAverage),
                       image: UIImage(),
                       year: movie.releaseDate ?? "")
    
            
            Task {
                
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let ivPoster = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, rating: String(movie.voteAverage), image: ivPoster, year: String(movie.releaseDate?.prefix(4) ?? ""))
            }
            
            
            return cell
            
        }
        
        
        
        return UITableViewCell()
    }
    
    // Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if tableView == seeAllTableView {
            
            movie = seeAllMovies[indexPath.item]
            
            print(seeAllMovies[indexPath.item])
            
        } else {
            return
            
        }
        
        self.performSegue(withIdentifier: "detailsSegue2", sender: movie)
        
    }
    
}
