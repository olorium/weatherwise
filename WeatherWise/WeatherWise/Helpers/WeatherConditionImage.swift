//
//  WeatherConditionImage.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 21.02.2023.
//

import UIKit
import WeatherKit

struct WeatherConditionImage {
    
    /// Provides image based on weather conditions categories.
    /// - Parameter condition: Weather condition.
    /// - Returns: appropriate `UIImage`.
    static func image(for condition: WeatherCondition) -> UIImage {
        switch condition.id.category {
        case .atmosphere: return UIImage(systemName: "wind")!
        case .clear: return UIImage(systemName: "sun.max.fill")!
        case .clouds: return UIImage(systemName: "cloud.fill")!
        case .drizzle: return UIImage(systemName: "cloud.drizzle.fill")!
        case .rain: return UIImage(systemName: "cloud.rain.fill")!
        case .snow: return UIImage(systemName: "cloud.snow.fill")!
        case .thunderstorm: return UIImage(systemName: "cloud.bolt.rain.fill")!
        case .unknown: return UIImage(systemName: "cloud")!
        }
    }
}
