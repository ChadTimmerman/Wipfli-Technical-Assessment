//
//  MovieDetailsViewController.swift
//  wipfli-tech-assessment
//
//  Created by Chad Timmerman on 3/16/21.
//

import UIKit

// TODO: Download & Display Movie Poster Image in the posterImageView

class MovieDetailsViewController: UIViewController {
    
    var movieDetails: MovieDetails
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    var stackView = UIStackView()
    
    var titleLabel = Label(style: .bold)
    var ratedLabel = Label(style: .regular)
    var ratingsLabel = Label(style: .regular)

    init(movieDetails: MovieDetails) {
        self.movieDetails = movieDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addPosterImage()
        addStackView()
        addLabels()
    }
    
    func addPosterImage() {
        view.addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        posterImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func addStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    func addLabels() {
        titleLabel.text = "Title: \(movieDetails.title)"
        stackView.addArrangedSubview(titleLabel)
        
        ratedLabel.text = "Rated: \(movieDetails.rated)"
        stackView.addArrangedSubview(ratedLabel)
        
        ratingsLabel.text = "IMDB Rating: \(movieDetails.imdbRating)"
        stackView.addArrangedSubview(ratingsLabel)
        
        stackView.addArrangedSubview(UIView())
    }  
}
