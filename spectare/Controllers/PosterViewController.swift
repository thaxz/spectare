//
//  PosterViewController.swift
//  spectare
//
//  Created by thaxz on 18/07/22.
//

import UIKit

// MARK: - Controller of "Poster" screen

class PosterViewController: UIViewController {

    // Storing and instantiating data from another screen
    
    var photoPoster = UIImage()
    var filmTitle = ""
    
    // Outlets from Storyboard
    
    @IBOutlet var ivBigPoster: UIImageView!
    
    // MARK: - View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up poster and title of the selected movie
        
        self.title = filmTitle
    
        ivBigPoster.image = photoPoster
       
    }
}
