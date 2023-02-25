//
//  CityWeatherLayout.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 16.02.2023.
//

import UIKit

/// Describes layout for the city.
struct CityWeatherLayout {
    
    /// Describes specific background for a section.
    enum DecorationKind: String {
        case sectionBackground = "section-decoration-background"
    }
    
    /// Describes sections for collections view.
    enum Section: Int {
        case currentWeather
        case hourlyForecast
        case weeklyForecast
    }
    
    /// Creates layout for a collectionView
    /// - Returns: `UICollectionViewCompositionalLayout` with currentWeather, hourlyForecast and weeklyForecast Sections.
    static func createLayout() -> UICollectionViewCompositionalLayout {
        let sections = [currentWeatherSection(), hourlyForecastSection(), weeklyForecastSection()]
        let layout = UICollectionViewCompositionalLayout { index, environment -> NSCollectionLayoutSection? in
            sections[index]
        }
        
        layout.register(SectionSeparatorView.self, forDecorationViewOfKind: DecorationKind.sectionBackground.rawValue)
        return layout
    }
    
    /// Creates current weather section.
    /// - Returns: NSCollectionLayoutSection` with currentWeatherItem group.
    private static func currentWeatherSection() -> NSCollectionLayoutSection {
        let currentWeatherItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let currentWeatherGroup = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200)), subitems: [currentWeatherItem])
        
        return NSCollectionLayoutSection(group: currentWeatherGroup)
    }
    
    /// Creates section for hourly forecast.
    /// - Returns: `NSCollectionLayoutSection` with hourlyItem group.
    private static func hourlyForecastSection() -> NSCollectionLayoutSection {
        let hourlyItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/7), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80)),
            subitems: [hourlyItem])
        
        let section = NSCollectionLayoutSection(group: group)
        section.decorationItems = [
            NSCollectionLayoutDecorationItem.background(elementKind: DecorationKind.sectionBackground.rawValue)
        ]
        return section
    }
    
    /// Creates section for weekly forecast.
    /// - Returns: `NSCollectionLayoutSection` with dayitems group.
    private static func weeklyForecastSection() -> NSCollectionLayoutSection {
        let dayItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), subitems: [dayItem])
        return NSCollectionLayoutSection(group: group)
    }
    
}
