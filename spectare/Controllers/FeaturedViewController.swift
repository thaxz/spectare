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
    
    // Passando infos pela segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? DetailsViewController else { return }
        guard let movie = sender as? Movie else { return }
        detailsViewController.movie = movie
    }
    
    
}
