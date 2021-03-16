//
//  MovieCell.swift
//  wipfli-tech-assessment
//
//  Created by Chad Timmerman on 3/16/21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var stackView = UIStackView()
    
    var titleLabel = Label(style: .bold)
    var detailsLabel = Label(style: .light)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        applyStyling()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyling() {
        backgroundColor = .white
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 4
    }
    
    private func setupSubviews() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    func populate(with movie: Movie) {
        titleLabel.text = movie.title
        detailsLabel.text = "year: \(movie.year)  |  type: \(movie.type)"
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailsLabel)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text?.removeAll()
        detailsLabel.text?.removeAll()
        
        stackView.removeArrangedSubview(titleLabel)
        stackView.removeArrangedSubview(detailsLabel)
    }
}


extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
