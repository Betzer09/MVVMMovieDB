//
//  Movie.swift
//  MVVMPractice
//
//  Created by Austin Betzer on 10/22/19.
//  Copyright © 2019 SparqsDev. All rights reserved.
//

import Foundation

struct Movie {
    
    var title: String
    var voteAverage: Double
    var overview: String
    
    init?(dict: [String: Any]) {
        guard let title = dict["title"] as? String,
            let voteAverage = dict["vote_average"] as? Double,
            let overview = dict["overview"] as? String else {return nil}
        
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
    }
}
