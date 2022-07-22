//
//  Movie.swift
//  spectare
//
//  Created by thaxz on 12/07/22.
//

import Foundation

// MARK: - Creating what we are going to get from API

struct Movie: Codable {
    
    let title: String
    let posterPath:  String?
    let backdropPath: String?
    let voteAverage: Float
    let releaseDate: String?
    let overview: String
    let genres: [String]?
    let id: Int
    
}

// Getting runtime

struct MovieDetails: Codable {
    let runtime: Int
    let genres: [GenresDetails]
}

// Getting genres

struct GenresDetails: Codable {
    let id: Int
    let name: String
}
