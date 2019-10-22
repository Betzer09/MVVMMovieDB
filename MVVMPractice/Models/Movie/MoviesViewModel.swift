//
//  MovieViewModel.swift
//  MVVMPractice
//
//  Created by Austin Betzer on 10/22/19.
//  Copyright © 2019 SparqsDev. All rights reserved.
//

import Foundation

/**
 This defines an array of movies
 */
struct MoviesViewModel {
    
    weak var dataSource: GenericDataSource<Movie>?
    
    init(dataSource: GenericDataSource<Movie>?) {
        self.dataSource = dataSource
    }
    
    func fetchMoviesWith(name: String) {
        MovieDBAPI.shared.fetchMoviesWith(name: name) { (result) in
            switch result {
            case .failure(let e):
                print("Failed to fetch movie: \(e.localizedDescription)")
            case .success(let movies):
                self.dataSource?.data.value = movies
            }
        }
    }
    
}
