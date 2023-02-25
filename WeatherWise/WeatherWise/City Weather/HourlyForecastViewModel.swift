//
//  HourlyForecastViewModel.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 21.02.2023.
//

import Foundation

/// ViewModel to manage hourly forecast.
class HourlyForecastViewModel {
    // MARK: - Private properties.
    private let dateFormatter: DateFormatter
    private let tempFormatter: MeasurementFormatter
    
    private let date: Date
    private let temp: Measurement<UnitTemperature>
    
    /// Creates `HourlyForecastViewModel`.
    /// - Parameters:
    ///   - dateFormatter: DateFormatted to convert Date to a time String.
    ///   - tempFormatter: MeasurementFormatter to convert temperature to daily high and lo temperatures String.
    ///   - date: Date to represent day.
    ///   - metric: Weather condition description.
    init(dateFormatter: DateFormatter, tempFormatter: MeasurementFormatter, date: Date, temp: Measurement<UnitTemperature>) {
        self.dateFormatter = dateFormatter
        self.tempFormatter = tempFormatter
        self.date = date
        self.temp = temp
    }
    
    // MARK: - Computed properties.
    var time: String {
        if abs(Date().distance(to: date)) < 60 * 60 {
            return "Now"
        } else {
            return dateFormatter.string(from: date)
                .lowercased()
        }
    }
    
    var temperature: String {
        tempFormatter.string(from: temp)
    }
}
