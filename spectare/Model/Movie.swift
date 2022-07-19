//
//  Movie.swift
//  spectare
//
//  Created by thaxz on 12/07/22.
//

import Foundation

struct Movie: Codable {
    
    let title: String
    let posterPath:  String
    let backdropPath: String
    let voteAverage: Float
    let releaseDate: String
    let overview: String
    let genres: [String]?
    let id: Int
    
    
    
    
}

struct MovieDetails: Codable {
    let runtime: Int
    let genres: [GenresDetails]
}

struct GenresDetails: Codable {
    let id: Int
    let name: String
}
