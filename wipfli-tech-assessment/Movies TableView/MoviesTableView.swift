//
//  MoviesTableView.swift
//  wipfli-tech-assessment
//
//  Created by Chad Timmerman on 3/16/21.
//

import UIKit

protocol MoviesTableViewDelegate: class {
    func getMovieDetails(for movie: Movie)
}

class MoviesTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    weak var moviesTableViewDelegate: MoviesTableViewDelegate?
    var viewModel = MoviesTableViewModel()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        applyStyling()
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyling() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        rowHeight = 56
        
        isHidden = true
    }
    
    private func setupSubviews() {
        register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
        delegate = self
        dataSource = self
    }
    
    func updateTableView(with results: [Movie]) {
        viewModel.moviesArray = results

        DispatchQueue.main.async { [self] in
            if viewModel.moviesArray.isEmpty {
                isHidden = true
            } else {
                isHidden = false
            }
            
            self.reloadData()
        }
    }
    
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        
        let movie = viewModel.moviesArray[indexPath.row]
        cell.populate(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.moviesArray[indexPath.row]
        moviesTableViewDelegate?.getMovieDetails(for: movie)
    }
}
