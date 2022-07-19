//
//  PosterViewController.swift
//  spectare
//
//  Created by thaxz on 18/07/22.
//

import UIKit

class PosterViewController: UIViewController {

    var photoPoster = UIImage()
    var filmTitle = ""
    
    @IBOutlet var ivBigPoster: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = filmTitle
    
        ivBigPoster.image = photoPoster
       
    }
        
        
    
    



}
