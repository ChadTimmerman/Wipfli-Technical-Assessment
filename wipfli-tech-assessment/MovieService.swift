//
//  MovieService.swift
//  wipfli-tech-assessment
//
//  Created by Chad Timmerman on 3/16/21.
//

import Foundation

// TODO: Build Image Caching System, Download Poster Image during each API call, Add poster Image to Movie & MovieDetails Data Models

class MovieService {
    
    func getSearchResults(for searchParameter: String, completion: @escaping ([Movie]?, Error?) -> ()) {
        let session = URLSession.shared
        let request = NetworkRequests.createSearchRequest(for: searchParameter)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(nil, error)
            } else {
                do {
                    guard let data = data else {
                        return completion(nil, error)
                    }
                    
                    let results = try JSONDecoder().decode(SearchResults.self, from: data)
                    let moviesArray = results.search
                    completion(moviesArray, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    func getMovieDetails(for movieId: String, completion: @escaping (MovieDetails?, Error?) -> ()) {
        let session = URLSession.shared
        let request = NetworkRequests.createMovieRequest(for: movieId)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(nil, error)
            } else {
                do {
                    guard let data = data else {
                        return completion(nil, error)
                    }
                    
                    let details = try JSONDecoder().decode(MovieDetails.self, from: data)
                    completion(details, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}
