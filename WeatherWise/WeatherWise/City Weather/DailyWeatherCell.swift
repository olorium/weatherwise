//
//  DailyWeatherCell.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 19.02.2023.
//

import UIKit

/// CollectionView cell with daily weather forecast.
class DailyWeatherCell: UICollectionViewCell {
    static let reuseIdentifier = "DailyWeatherCell"
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var chanceOfRainLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
}

extension DailyWeatherCell {
    
    /// Updates `DailyWeatherCell` with viewModel values.
    /// - Parameter viewModel: Corresponding `DailyForecastViewModel`.
    func update(with viewModel: DailyForecastViewModel) {
        dayLabel.text = viewModel.day
        
        if viewModel.showsRainChance {
            chanceOfRainLabel.text = viewModel.chanceOfRain
        } else {
            chanceOfRainLabel.text = ""
        }
        
        lowTemperatureLabel.text = viewModel.dailyLow
        highTemperatureLabel.text = viewModel.dailyHigh
        conditionImageView.image = viewModel.conditionImage
    }
}
