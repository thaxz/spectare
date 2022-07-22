//
//  MovieResponse.swift
//  spectare
//
//  Created by thaxz on 15/07/22.
//

import Foundation

// MARK: - A place to hold our response from API

struct MovieResponse: Codable {
    
    let results: [Movie]
    
}
