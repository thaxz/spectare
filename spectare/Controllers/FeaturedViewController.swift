//
//  FeaturedViewController.swift
//  spectare
//
//  Created by thaxz on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    // Instanciando cada array
    
    var popularMovies: [Movie] = []
    
    var nowPlayingMovies: [Movie] = []
    
    var upcomingMovies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Implementando o dataSource
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        // Implementando o delegate
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        // Adicionando tasks
        
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
    
    // Botão See All
    
    @IBAction func seeAll(_ sender: UIButton) {
        
    }
    
    
    // Passando infos pela segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailsSegue" {
            guard let detailsViewController = segue.destination as? DetailsViewController else { return }
            guard let movie = sender as? Movie else { return }
            detailsViewController.movie = movie
        }
        else if segue.identifier == "popularSeeAll" {
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
