//
//  HourlyWeatherCell.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 21.02.2023.
//

import UIKit

/// Cell with hourly weather.
class HourlyWeatherCell: UICollectionViewCell {
    static let reuseIdentifier = "HourlyWeatherCell"
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
}

extension HourlyWeatherCell {
    /// Updates `HourlyWeatherCell` with valid info.
    /// - Parameter viewModel: `HourlyForecastViewModel` with values to update from.
    func update(with viewModel: HourlyForecastViewModel) {
        timeLabel.text = viewModel.time
        tempLabel.text = viewModel.temperature
    }
}
