//
//  NetworkConfiguration.swift
//  wipfli-tech-assessment
//
//  Created by Chad Timmerman on 3/16/21.
//

import Foundation

struct Constants {
    static var shared = Constants()
    
    let apiKey: String
    
    private init() {
        apiKey = "fe156bea"
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

enum Environment {
    case development
    case staging
    case production
    
    var host: String {
        switch self {
        case .development: return ""
        case .staging: return ""
        case .production: return "www.omdbapi.com"
        }
    }
}

class NetworkConfiguration {
    static let shared = NetworkConfiguration()
    
    var environment: Environment = {
        return Environment.production
    }()
    
    func createURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = environment.host
        components.queryItems = [URLQueryItem(name: "apiKey", value: Constants.shared.apiKey)]
        
        return components
    }
    
    func createURLRequest(for url: URL, method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
