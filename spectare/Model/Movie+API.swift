//
//  Movie+API.swift
//  FilmADA
//
//  Created by Francisco Soares Neto on 13/07/22.
//

import Foundation

extension Movie {
    
    // API's path
    
    static let urlComponents = URLComponents(string: "https://api.themoviedb.org/")!
    
    // MARK: - Requesting things to API
    
    // Getting "Popular" from API
    
    static func popularMoviesAPI() async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/movie/popular"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data,_) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MovieResponse.self, from: data)
            
            return movieResult.results
            
        } catch {
            print(error.localizedDescription)
        }
    
        return []
    }
    
    // Getting "Now Playing" from API
    
    static func nowPlayingMoviesAPI() async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/movie/now_playing"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data,_) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MovieResponse.self, from: data)
            
            return movieResult.results
            
        } catch {
            print(error.localizedDescription)
        }
    
        return []
    }
    
    // Getting "Upcoming" from API
    
    static func upcomingMoviesAPI() async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/movie/upcoming"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data,_) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MovieResponse.self, from: data)
            
            return movieResult.results
            
        } catch {
            print(error.localizedDescription)
        }
    
        return []
    }
    
    // Getting "Search" from API
    
    static func searchMoviesAPI(title: String) async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/search/movie"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey),
            URLQueryItem(name: "query", value: title)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data,_) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MovieResponse.self, from: data)
            
            return movieResult.results
            
        } catch {
            print(error.localizedDescription)
        }
    
        return []
    }
    
    // Getting runtime and genres of the selected movie from API
    
    static func detailsMoviesAPI(_ movieId: Int) async -> MovieDetails {
        
        var components = Movie.urlComponents
        components.path = "/3/movie/\(movieId)"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data,_) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MovieDetails.self, from: data)
            
            return movieResult
            
        } catch {
            print(error.localizedDescription)
        }
    
        return MovieDetails(runtime: 0, genres: [])
    }
    
    // Getting "Trending Week Movies" from API
    
    static func trendingWeekMoviesAPI() async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/trending/movie/week"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data,_) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MovieResponse.self, from: data)
            
            return movieResult.results
            
        } catch {
            print(error.localizedDescription)
        }
    
        return []
    }
    
    // Getting "Trending Day Movies" from API
    
    static func trendingDayMoviesAPI() async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/trending/movie/day"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data,_) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MovieResponse.self, from: data)
            
            return movieResult.results
            
        } catch {
            print(error.localizedDescription)
        }
    
        return []
    }
    
    // MARK: - Getting all image related data from API
    
    static func downloadImageData(withPath: String) async -> Data {
        let urlString = "https://image.tmdb.org/t/p/w780\(withPath)"
        let url: URL = URL(string: urlString)!
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: url)
            return data
            
        } catch {
            print(error.localizedDescription)
        }
        
        
        return Data()
    }
    
    // MARK: - Getting API Key from file "TMDB-Info.plist"
    
    static var apiKey: String {
        guard let url = Bundle.main.url(forResource: "TMDB-Info", withExtension: "plist") else {
            fatalError("Couldn't find api key configuration file.")
        }
        guard let plist = try? NSDictionary(contentsOf: url, error: ()) else {
            fatalError("Couldn't interpret api key configuration file as plist.")
        }
        guard let key = plist["API_KEY"] as? String else {
            fatalError("Couldn't find an api key in its configuration file.")
        }
        return key
    }
}

