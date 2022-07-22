//
//  SearchViewController.swift
//  spectare
//
//  Created by thaxz on 19/07/22.
//

import UIKit

// MARK: - Controller of "Search" screen

class SearchViewController: UIViewController, UISearchResultsUpdating {

    // Storing and instantiating what we are going to get from API
    
    var searchMovies: [Movie] = []
    
    // Outlets from Storyboard
    
    @IBOutlet var tableViewSearch: UITableView!
    @IBOutlet var lbSearch: UIStackView!
    
    // Instantiating searchController
    
    let searchController = UISearchController()
    
    // MARK: - View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Defining Delegate and DataSource of Search TableView
        
        tableViewSearch.dataSource = self
        tableViewSearch.delegate = self
        
        // Setting up searchController
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
       
    }
    
    // Closing keyboard as you touch anywhere else on the screen
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        lbSearch.isHidden = false
    }
    
    // Updating results as soon as you type something
    
    func updateSearchResults(for searchController: UISearchController) {
        
        lbSearch.isHidden = true
        guard let title = searchController.searchBar.text else {return}
        
        Task {
            
            self.searchMovies = await Movie.searchMoviesAPI(title: title)
            tableViewSearch.reloadData()
        }
        
    }
    
    // Moving data to Details screen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "searchDetailSegue" {
            guard let detailsViewController = segue.destination as? DetailsViewController else { return }
            guard let movie = sender as? Movie else { return }
            detailsViewController.movie = movie
        } else {
            return }
        
    }
    
}

// MARK: - Implementing Delegate and DataSource of Search Tableview

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchMovies.count
    }
    
    // Setting up cell
    
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
    
    // Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if tableView == tableViewSearch {
            
            movie = searchMovies[indexPath.item]
            
            self.performSegue(withIdentifier: "searchDetailSegue", sender: movie)
        }
    }
}
