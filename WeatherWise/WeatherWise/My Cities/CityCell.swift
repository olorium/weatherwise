//
//  CityCell.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 21.02.2023.
//

import UIKit
import Combine

/// Cell for cities.
class CityCell: UICollectionViewCell {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var localityLabel: UILabel!
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        nameLabel.textColor = .white
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        localityLabel.textColor = UIColor.white.withAlphaComponent(0.8)
        localityLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }
}

extension CityCell {
    
    /// Updates cell with City data.
    /// - Parameter viewModel: ViewModel with appropriate data.
    func update(with viewModel: CityViewModel) {
        nameLabel.text = viewModel.cityName
        localityLabel.text = viewModel.cityLocality
        
        viewModel.$currentTemperature
            .map { $0 as String? }
            .assign(to: \.text, on: currentTemperatureLabel)
            .store(in: &cancellables)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cancellables = []
        nameLabel.text = ""
        localityLabel.text = ""
        currentTemperatureLabel.text = ""
    }
}
