//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  spectare
//
//  Created by thaxz on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if collectionView == popularCollectionView {
            
            movie = popularMovies[indexPath.item]
            
            print(popularMovies[indexPath.item])
            
        } else if collectionView == nowPlayingCollectionView {
            
            movie = nowPlayingMovies[indexPath.item]
            
            print(nowPlayingMovies[indexPath.item])

        } else {
            movie = upcomingMovies[indexPath.item]
        }
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        
    }
      
}
