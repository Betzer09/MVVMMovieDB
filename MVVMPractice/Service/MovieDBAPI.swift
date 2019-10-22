//
//  MovieDBAPI.swift
//  MVVMPractice
//
//  Created by Austin Betzer on 10/22/19.
//  Copyright © 2019 SparqsDev. All rights reserved.
//

import Foundation
import UIKit


enum ServiceError {
    case NoData
}

final class MovieDBAPI {
    
    static let shared = MovieDBAPI()
    
    fileprivate let baseEndpoint = "https://api.themoviedb.org/3/search/movie"
    fileprivate let MOVIE_API_KEY = "c366b28fa7f90e98f633846b3704570c"
    
    /**
     Fetches movies from MovieDB
     - parameter name: The name of the movie you are looking for
     - parameter completion: Upon completion succesfull completion of the task an array of movies will be returned, otherwise an error will be returned.
     */

    func fetchMoviesWith(name: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        var componts = URLComponents(url: URL(string: baseEndpoint)!, resolvingAgainstBaseURL: false)
        let apiItem = URLQueryItem(name: "api_key", value: MOVIE_API_KEY)
        let movieID = URLQueryItem(name: "query", value: name)
        componts?.queryItems = [apiItem, movieID]
        
        guard let url = componts?.url else {fatalError("Failed request")}
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data,
                let result = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                let moviesJson = result["results"] as? [[String: Any]] else {return}
            
            var movies = [Movie]()
            for json in moviesJson {
                guard let movie = Movie(dict: json) else {continue}
                movies.append(movie)
            }
        
            completion(.success(movies))
        }.resume()
    }
    
    
}
