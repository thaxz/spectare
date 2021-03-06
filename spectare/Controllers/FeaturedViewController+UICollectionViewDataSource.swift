//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  spectare
//
//  Created by thaxz on 12/07/22.
//

import UIKit

// MARK: - Implementing protocol DataSource of collection view

extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Switching results according to each collection view
        
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
    
    // MARK: - Setting up each cell
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // MARK: "Popular" cell
        
        if collectionView == popularCollectionView {
            
            let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as! PopularCollectionViewCell
            
            // Setting up cell
            
            cell.setup(title: popularMovies[indexPath.item].title,
                       image: UIImage())
            
            let movie = popularMovies[indexPath.item]
            
            Task {
                
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath ?? "")
                let ivPoster = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: ivPoster)
            }
            
            
            return cell
            
        }
        
        // MARK: NowPlaying cell
        
        else if collectionView == nowPlayingCollectionView {
            
            let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as! NowPlayingCollectionViewCell
            
            cell.setup(title: nowPlayingMovies[indexPath.item].title,
                       image: UIImage(),
                       date: String(nowPlayingMovies[indexPath.item].releaseDate!.prefix(4)))
            
            let movie = nowPlayingMovies[indexPath.item]
            
            Task {
                
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let ivPoster = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: ivPoster, date: String(movie.releaseDate!.prefix(4)))
            }
            
            return cell
            
        }
        
        // MARK: Upcoming cell
        
        else if collectionView == upcomingCollectionView {
            
            let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as! UpcomingCollectionViewCell
            
            cell.setup(title: upcomingMovies[indexPath.item].title,
                       image: UIImage(),
                       date: upcomingMovies[indexPath.item].releaseDate ?? "")
            
            let movie = upcomingMovies[indexPath.item]
            
            Task {
                
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath!)
                let ivPoster = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: ivPoster, date: movie.releaseDate ?? "")
            }
            
            return cell
            
        }
        
        return UICollectionViewCell()
    }
}
