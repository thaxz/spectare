//
//  SeeAllViewController.swift
//  spectare
//
//  Created by thaxz on 18/07/22.
//

import UIKit

class SeeAllViewController: UIViewController {

    @IBOutlet var seeAllTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        seeAllTableView.dataSource = self
        seeAllTableView.delegate = self
      
    }
    


}

extension SeeAllViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
