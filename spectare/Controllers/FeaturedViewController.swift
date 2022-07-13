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
    
    // Instanciando cada extensão
    
    let popularMovies = Movie.popularMovies()
    
    let nowPlayingMovies = Movie.nowPlayingMovies()
    
    let upcomingMovies = Movie.upcomingMovies()
    
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? DetailsViewController else { return }
        guard let movie = sender as? Movie else { return }
        detailsViewController.movie = movie
    }
    
    
}
