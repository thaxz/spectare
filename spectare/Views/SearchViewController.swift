//
//  SearchViewController.swift
//  spectare
//
//  Created by thaxz on 19/07/22.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating {

    
    @IBOutlet var tableViewSearch: UITableView!
    
    var searchMovies: [Movie] = []
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewSearch.dataSource = self
        tableViewSearch.delegate = self
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let title = searchController.searchBar.text else {return}
        
        Task {
            self.searchMovies = await Movie.searchMoviesAPI(title: title)
            tableViewSearch.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "searchDetailSegue" {
            guard let detailsViewController = segue.destination as? DetailsViewController else { return }
            guard let movie = sender as? Movie else { return }
            detailsViewController.movie = movie
        } else {
            return }
        
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewSearch.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        
        let movie = searchMovies[indexPath.item]
        
        cell.setup(title: movie.title, image: UIImage(), year: String(movie.releaseDate?.prefix(4) ?? ""))
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
            let image = UIImage(data: imageData) ?? UIImage()
            cell.setup(title: movie.title, image: image, year: String(movie.releaseDate?.prefix(4) ?? ""))
            
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if tableView == tableViewSearch {
            
            movie = searchMovies[indexPath.item]
            
            self.performSegue(withIdentifier: "searchDetailSegue", sender: movie)
        }
        
        
    }
    
}
