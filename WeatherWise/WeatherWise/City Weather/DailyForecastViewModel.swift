//
//  DailyForecastViewModel.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 21.02.2023.
//

import Foundation
import WeatherKit
import UIKit

/// ViewModel to manage daily forecast.
struct DailyForecastViewModel {
    
    // MARK: - Private properties
    private let dateFormatter: DateFormatter
    private let tempFormatter: MeasurementFormatter
    private let date: Date
    private let metric: WeatherMetrics<DailyTemperatures>
    
    // MARK: - Conputed properties
    var day: String {
        dateFormatter.string(from: date)
    }
    
    var showsRainChance: Bool {
        probabilityOfPrecipitation > 0
    }
    
    var dailyHigh: String? {
        metric.temp.max.flatMap { tempFormatter.string(from: $0.measurement) }
    }
    
    var dailyLow: String? {
        metric.temp.min.flatMap { tempFormatter.string(from: $0.measurement) }
    }
    
    var chanceOfRain: String {
        String(format: "%.0f%%", probabilityOfPrecipitation)
    }
    
    private var probabilityOfPrecipitation: Float {
        metric.pop ?? 0
    }
    
    var conditionImage: UIImage? {
        metric.weather.first.flatMap { WeatherConditionImage.image(for: $0) }
    }
    
    
    /// Creates a `DailyForecastViewModel`
    /// - Parameters:
    ///   - dateFormatter: DateFormatted to convert Date to day String.
    ///   - tempFormatter: MeasurementFormatter to convert temperature to daily high and lo temperatures String.
    ///   - date: Date to represent day.
    ///   - metric: Weather condition description.
    init(dateFormatter: DateFormatter, tempFormatter: MeasurementFormatter, date: Date, metric: WeatherMetrics<DailyTemperatures>) {
        self.dateFormatter = dateFormatter
        self.tempFormatter = tempFormatter
        self.date = date
        self.metric = metric
    }
}
