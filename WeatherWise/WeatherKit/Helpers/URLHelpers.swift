//
//  World.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 18.02.2023.
//

import Foundation

public extension URL {
    func appending(path: String) -> URL {
        appendingPathComponent(path, isDirectory: false)
    }
    
    func appending(queryParams: [String: String]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)!
        components.queryItems = queryParams.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        return components.url!
    }
}
