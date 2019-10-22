//
//  MovieViewModel.swift
//  MVVMPractice
//
//  Created by Austin Betzer on 10/22/19.
//  Copyright © 2019 SparqsDev. All rights reserved.
//

import Foundation
import UIKit

/**
 This handles a single Movie.
 
 Per MVVM all logic should be done in the view model. That includes fetching information from a serviceAPI, converting data, rendering a color because of a specifc property. Views, ViewController, etc should not perform buiness logic based on the Models properties.
 */
struct MovieViewModel {
    let title: String
    let rating: String
    let description: String
    let cellBackgroundColor: UIColor
    
    // Dependency Injection
    init(movie: Movie) {
        self.title = movie.title
        self.rating = "\(movie.voteAverage)"
        self.description = movie.overview
        self.cellBackgroundColor = movie.voteAverage > 7.5 ? UIColor.green : UIColor.red
    }
}
