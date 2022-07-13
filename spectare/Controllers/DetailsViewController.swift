//
//  DetailsViewController.swift
//  spectare
//
//  Created by thaxz on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = movie?.title
       
    }
    

}
