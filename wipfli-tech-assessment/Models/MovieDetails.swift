//
//  MovieDetails.swift
//  wipfli-tech-assessment
//
//  Created by Chad Timmerman on 3/16/21.
//

import Foundation

// TODO: Add poster image to Model

struct MovieDetails: Codable {
    let title: String
    let year: String
    let rated: String
    let released: String
    let runtime: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let language: String
    let country: String
    let awards: String
    let poster: String
    let metascore: String
    let imdbRating: String
    let imdbVotes: String
    let imdbID: String
    let type: String
    let dvdRelease: String
    let boxOffice: String
    let productionCompany: String
    let website: String
    let response: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvdRelease = "DVD"
        case boxOffice = "BoxOffice"
        case productionCompany = "Production"
        case website = "Website"
        case response = "Response"
    }
}
