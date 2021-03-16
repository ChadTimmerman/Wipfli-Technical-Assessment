//
//  NetworkRequests.swift
//  wipfli-tech-assessment
//
//  Created by Chad Timmerman on 3/16/21.
//

import Foundation

// API Documentation - http://www.omdbapi.com/

class NetworkRequests {
    
    class func createSearchRequest(for searchParameter: String) -> URLRequest {
        var components = NetworkConfiguration.shared.createURLComponents()
        components.queryItems?.append(URLQueryItem(name: "s", value: searchParameter))
        
        guard let url = components.url else {
            fatalError("Invalid URL")
        }
        
        return NetworkConfiguration.shared.createURLRequest(for: url, method: .get)
    }
    
    class func createMovieRequest(for movieId: String) -> URLRequest {
        var components = NetworkConfiguration.shared.createURLComponents()
        components.queryItems?.append(URLQueryItem(name: "i", value: movieId))
        
        guard let url = components.url else {
            fatalError("Invalid URL")
        }
        
        return NetworkConfiguration.shared.createURLRequest(for: url, method: .get)
    }
}
