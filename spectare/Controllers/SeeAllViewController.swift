//
//  SeeAllViewController.swift
//  spectare
//
//  Created by thaxz on 18/07/22.
//

import UIKit

// MARK: - Controller of "Trending" screen

class SeeAllViewController: UIViewController {
    
    // Storing and instantiating what we are going to get from API
    
    var seeAllMovies: [Movie] = []
    
    // Outlets from Storyboard
    
    @IBOutlet var seeAllTableView: UITableView!
    
    // MARK: - View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Defining Delegate and DataSource of See All TableView
        
        seeAllTableView.dataSource = self
        seeAllTableView.delegate = self
        
    }
    
    // Moving data to Details screen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? DetailsViewController else { return }
        guard let movie = sender as? Movie else { return }
        detailsViewController.movie = movie
    }
}

// MARK: - Implementing Delegate and DataSource of See All Tableview

extension SeeAllViewController: UITableViewDelegate, UITableViewDataSource {
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return seeAllMovies.count
    }
    
    // Setting up cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == seeAllTableView {
            
            let cell = seeAllTableView.dequeueReusableCell(withIdentifier: SeeAllTableViewCell.cellIdentifier, for: indexPath) as! SeeAllTableViewCell
            
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
