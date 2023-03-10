//
//  CurrentWeatherCell.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 19.02.2023.
//

import UIKit
import Combine

/// Cell for the current city.
class CurrentWeatherCell: UICollectionViewCell {
    static let reuseIdentifier = "CurrentWeatherCell"
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var lowHighTemperatureLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    @IBOutlet var conditionImageView: UIImageView!
    
    var cancellables = Set<AnyCancellable>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        conditionImageView.alpha = 0.8
    }
}

extension CurrentWeatherCell {
    /// Updates city cell from viewModel.
    /// - Parameter viewModel: `CityWeatherViewModel` to get values from.
    func update(with viewModel: CityWeatherViewModel) {
        cityNameLabel.text = viewModel.cityName
        
        viewModel.currentTemperature
            .assign(to: \.text, on: temperatureLabel)
            .store(in: &cancellables)
        
        viewModel.currentConditionImage
            .assign(to: \.image, on: conditionImageView)
            .store(in: &cancellables)
        
        viewModel.currentHighLowTemperature
            .assign(to: \.text, on: lowHighTemperatureLabel)
            .store(in: &cancellables)
        
        viewModel.feelsLike
            .assign(to: \.text, on: feelsLikeLabel)
            .store(in: &cancellables)
    }
}
