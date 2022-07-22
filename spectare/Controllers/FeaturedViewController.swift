//
//  FeaturedViewController.swift
//  spectare
//
//  Created by thaxz on 05/07/22.
//

import UIKit

// MARK: - Controller of "Search" screen

class FeaturedViewController: UIViewController {
    
    // Storing and instantiating what we are going to get from API
    
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    // Outlets from Storyboard
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    // MARK: - View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Defining Delegate and DataSource of Trending TableView
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        // Task to load get request
        
        Task {
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
        }
        
        Task {
            self.nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
        }
        
        Task {
            self.upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionView.reloadData()
        }
        
    }
    
    // Moving data to Details and See All screen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailsSegue" {
            
            guard let detailsViewController = segue.destination as? DetailsViewController else { return }
            guard let movie = sender as? Movie else { return }
            detailsViewController.movie = movie
            
        } else if segue.identifier == "popularSeeAll" {
            
            guard let seeAllViewController = segue.destination as? SeeAllViewController else { return }
            seeAllViewController.seeAllMovies = popularMovies
            seeAllViewController.title = "Popular movies"
            
        } else if segue.identifier == "nowPlayingSeeAll" {
            
            guard let seeAllViewController = segue.destination as? SeeAllViewController else { return }
            seeAllViewController.seeAllMovies = nowPlayingMovies
            seeAllViewController.title = "Now Playing"
            
        } else if segue.identifier == "upcomingSeeAll" {
            
            guard let seeAllViewController = segue.destination as? SeeAllViewController else { return }
            seeAllViewController.seeAllMovies = upcomingMovies
            seeAllViewController.title = "Upcoming Movies"
        }
    }
}
