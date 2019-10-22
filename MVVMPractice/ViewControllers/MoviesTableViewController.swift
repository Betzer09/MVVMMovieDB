//
//  MoviesTableViewController.swift
//  MVVMPractice
//
//  Created by Austin Betzer on 10/22/19.
//  Copyright © 2019 SparqsDev. All rights reserved.
//

import UIKit

/**
 A view controller should only ever configure it UI
 */
class MoviesTableViewController: UITableViewController {
    
    // MARK: Outlets
    
    // MARK: Properties
    
    // The viewModel should not be aware of its view it is binding too
    let dataSource = MovieDataSource()
    
    lazy var viewModel: MoviesViewModel = {
        let viewModel = MoviesViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    // MARK: View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Actions
    
    // MARK: Functions
    fileprivate func setupUI() {
        self.tableView.dataSource = self.dataSource
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            guard let strongSelf = self else {return}
            
            DispatchQueue.main.async {
                strongSelf.tableView.reloadData()
            }
        }
        
        self.viewModel.fetchMoviesWith(name: "Shrek")
    }
}
