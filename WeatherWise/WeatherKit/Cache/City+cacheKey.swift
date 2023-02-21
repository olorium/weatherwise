//
//  World.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 21.02.2023.
//

import Foundation

public extension City {
    var cacheKey: String {
        String(format: "lat:%.2f|lng:%.2f", latitude, longitude)
    }
}
