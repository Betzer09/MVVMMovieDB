//
//  MovieCell.swift
//  MVVMPractice
//
//  Created by Austin Betzer on 10/22/19.
//  Copyright © 2019 SparqsDev. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell {
    
    // MARK: - Properties
    var movieViewModel: MovieViewModel! {
        didSet {
            setupUI()
        }
    }
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - UI
    
    fileprivate func setupUI() {
        textLabel?.text = movieViewModel.title
        detailTextLabel?.text = movieViewModel.description
        backgroundColor = movieViewModel.cellBackgroundColor
    }
    
}
