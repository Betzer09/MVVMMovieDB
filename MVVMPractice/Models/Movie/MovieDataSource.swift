//
//  MovieDataSource.swift
//  MVVMPractice
//
//  Created by Austin Betzer on 10/22/19.
//  Copyright © 2019 SparqsDev. All rights reserved.
//

/**
 This class is designed to specifally be the datasource for the model. This means that if you populating a tablview, collection view, or anything that list the data you should use this class.
 
 No UI should ever know about the class. The class should be completely abstracted from all UIKit frameworks! Doing otherwise will be stricly againts our design MVVM design pattern which will lead to increasly complex code.
 */
import Foundation
import UIKit


/// The viewModel should not be aware of its view it is binding too
class MovieDataSource: GenericDataSource<Movie>, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movieForCell = data.value[indexPath.row]
        cell.movieViewModel = MovieViewModel(movie: movieForCell)
        return cell
    }
    
}
