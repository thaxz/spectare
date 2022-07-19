//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  spectare
//
//  Created by thaxz on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
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
        
        // Making popular cell
        
        if collectionView == popularCollectionView {
            
            let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as! PopularCollectionViewCell
            
            // Preenchendo a célula
            
            cell.setup(title: popularMovies[indexPath.item].title,
                       image: UIImage())
            
            let movie = popularMovies[indexPath.item]
            
            Task {
                
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
                let ivPoster = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: ivPoster)
            }
            
            
            return cell
            
        } else if collectionView == nowPlayingCollectionView {
            
            // Making NowPlaying cell
            
            let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as! NowPlayingCollectionViewCell
            
            cell.setup(title: nowPlayingMovies[indexPath.item].title,
                       image: UIImage(),
                       date: String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4)))
            
            let movie = nowPlayingMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let ivPoster = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: ivPoster, date: String(movie.releaseDate.prefix(4)))
            }
            
            return cell
            
        // Making upcoming cell
            
        } else if collectionView == upcomingCollectionView {
            
            let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as! UpcomingCollectionViewCell
            
            cell.setup(title: upcomingMovies[indexPath.item].title,
                       image: UIImage(),
                       date: upcomingMovies[indexPath.item].releaseDate)
            
            let movie = upcomingMovies[indexPath.item]
            
            Task {
                
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let ivPoster = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: ivPoster, date: movie.releaseDate)
            }
            
            
            return cell
            
        }
        
        return UICollectionViewCell()
    }
    

    
    
    
    
    
    
}
