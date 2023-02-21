//
//  World.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 21.02.2023.
//

import Foundation
import WeatherKit

struct World {
    var weatherAPI: OpenWeatherMapAPIClient
    var citiesStore: CitiesStore
    var weatherManager: WeatherManager
}

var Current = World(
    weatherAPI: OpenWeatherMapAPIClient(),
    citiesStore: CitiesStore.load(),
    weatherManager: WeatherManager()
)
