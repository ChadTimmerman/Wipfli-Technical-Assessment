//
//  ViewController.swift
//  wipfli-tech-assessment
//
//  Created by Chad Timmerman on 3/16/21.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {
    
    let moviesTableView = MoviesTableView()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .darkGray
        return indicator
    }()
    
    var emptyStateLabel = Label(style: .bold)
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        searchForMovies(text: text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Movie Search"
        
        addSearchController()
        addTableView()
        addActivityIndicator()
        addEmptyState()
    }
    
    private func addSearchController() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type here to search"
        navigationItem.searchController = search
    }
    
    private func addTableView() {
        moviesTableView.moviesTableViewDelegate = self
        
        self.view.addSubview(moviesTableView)
        moviesTableView.translatesAutoresizingMaskIntoConstraints = false
        moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        moviesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        moviesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func addActivityIndicator() {
        view.addSubview(activityIndicator)
        view.bringSubviewToFront(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 135).isActive = true
    }
    
    func addEmptyState() {
        emptyStateLabel.text = "No Results Found"

        view.addSubview(emptyStateLabel)
        emptyStateLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyStateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyStateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        emptyStateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            if self.moviesTableView.viewModel.moviesArray.isEmpty {
                self.emptyStateLabel.isHidden = false
            } else {
                self.emptyStateLabel.isHidden = true
            }
        }
    }
    
    func searchForMovies(text: String) {
        activityIndicator.startAnimating()
        
        MovieService().getSearchResults(for: text) { (movies, error) in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            self.moviesTableView.updateTableView(with: movies ?? [])
            self.updateUI()
        }
    }
    
    func getDetails(for movie: Movie) {
        activityIndicator.startAnimating()

        MovieService().getMovieDetails(for: movie.imdbID) { (movieDetails, error) in
            if error != nil {
                self.activityIndicator.stopAnimating()
                print(error?.localizedDescription as Any)
            } else {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()

                    guard let details = movieDetails else { return }
                    let detailsViewController = MovieDetailsViewController(movieDetails: details)
                    self.navigationController?.pushViewController(detailsViewController, animated: true)
                }
            }
        }
    }
}

extension ViewController: MoviesTableViewDelegate {
    func getMovieDetails(for movie: Movie) {
        getDetails(for: movie)
    }
}
