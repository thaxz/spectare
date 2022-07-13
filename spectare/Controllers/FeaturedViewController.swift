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
        
        // Alimentando as collectionViews
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
    }
    
    
}
