//
//  World.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 18.02.2023.
//

import Foundation

public struct OneCallResult: Codable {
    public let current: WeatherMetrics<SingleTemperature>
    public let hourly: [WeatherMetrics<SingleTemperature>]
    public let daily: [WeatherMetrics<DailyTemperatures>]
}
