//
//  TrendingViewController.swift
//  spectare
//
//  Created by thaxz on 20/07/22.
//

import UIKit

// MARK: - Controller of "Trending" screen

class TrendingViewController: UIViewController {
    
    // Storing and instantiating what we are going to get from API
    
    var trendingMovies: [Movie] = []
    var trendingDayMovies: [Movie] = []
    var trendingWeekMovies: [Movie] = []
    
    // Outlets from Storyboard
    
    @IBOutlet var trendingTableView: UITableView!
    @IBOutlet var scTrending: UISegmentedControl!
    
    // MARK: - View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Changing colors of segmented controller as we change it's value
        
        scTrending.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "white") ?? 0], for: UIControl.State.selected)
        scTrending.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "background") ?? 0], for: UIControl.State.normal)
        
        // Defining Delegate and DataSource of Trending TableView
        
        trendingTableView.delegate = self
        trendingTableView.dataSource = self
        
        // Task to load get request
        
        Task {
            
            self.trendingDayMovies = await Movie.trendingDayMoviesAPI()
            self.trendingWeekMovies = await Movie.trendingWeekMoviesAPI()
            self.trendingMovies = trendingDayMovies
            trendingTableView.reloadData()
        }
        
    }
    
    // Defining values to each element of segmented controller
    
    @IBAction func touchTrendingSc(_ sender: UISegmentedControl) {
        if scTrending.selectedSegmentIndex == 0 {
            trendingMovies = trendingDayMovies
            trendingTableView.reloadData()
        } else {
            trendingMovies = trendingWeekMovies
            trendingTableView.reloadData()
        }
    }
    
    // Moving data to Details screen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            detailsViewController.movie = movie
        }
    }
}

// MARK: - Implementing Delegate and DataSource of Trending Tableview

extension TrendingViewController: UITableViewDelegate, UITableViewDataSource {
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    // Setting up cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = trendingTableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.cellIdentifier, for: indexPath) as! TrendingTableViewCell
        
        let movie = trendingMovies[indexPath.item]
        
        cell.setup(title: movie.title, image: UIImage(), year: String(movie.releaseDate?.prefix(4) ?? ""))
        
        Task {
            
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
            let image = UIImage(data: imageData) ?? UIImage()
            cell.setup(title: movie.title, image: image, year: String(movie.releaseDate?.prefix(4) ?? ""))
            
        }
        return cell
        
    }
    
    // Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie: Movie
        movie = trendingMovies[indexPath.item]
        self.performSegue(withIdentifier: "trendingToDetailsSegue", sender: movie)
    }
}
