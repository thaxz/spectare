//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  spectare
//
//  Created by thaxz on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Escolhendo a célula
        
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else if collectionView == upcomingCollectionView {
            return upcomingMovies.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            
            let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! PopularCollectionViewCell
            
            // Preenchendo a célula
            
            cell.lbTitle.text = popularMovies[indexPath.item].title
            cell.ivFilm.image = UIImage(named: popularMovies[indexPath.item].backdrop)
            
            return cell
            
        } else if collectionView == nowPlayingCollectionView {
            
            let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as! NowPlayingCollectionViewCell
            
            cell.lbTitle.text = nowPlayingMovies[indexPath.item].title
            cell.ivFilm.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
            cell.lbDate.text = nowPlayingMovies[indexPath.item].releaseDate
            
            return cell
            
        } else if collectionView == upcomingCollectionView {
            
            let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpcomingCollectionViewCell
            
            cell.lbTitle.text = upcomingMovies[indexPath.item].title
            cell.ivFilm.image = UIImage(named: upcomingMovies[indexPath.item].poster)
            cell.lbDate.text = upcomingMovies[indexPath.item].releaseDate
            
            return cell
            
        }
        
        return UICollectionViewCell()
    }
    
    
    
    
    
    
    
    
}
