//
//  World.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 21.02.2023.
//

import Foundation

public class CitiesStore {
    @Published
    public private(set) var cities: [City]
    
    public init(cities: [City]) {
        self.cities = cities
    }
    
    private static let userDefaultsKey = "cities"
    
    public static func load() -> CitiesStore {
        let decoder = JSONDecoder()
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            return CitiesStore(cities: [])
        }
        do {
            let cities = try decoder.decode([City].self, from: data)
            return CitiesStore(cities: cities)
        } catch {
            print("Error decoding cities: \(error)")
            return CitiesStore(cities: [])
        }
    }
    
    public func add(_ city: City) {
        cities.append(city)
        try! save()
    }
    
    public func remove(_ city: City) {
        guard let index = cities.firstIndex(of: city) else { return }
        cities.remove(at: index)
        try! save()
    }
    
    public func save() throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(cities)
        UserDefaults.standard.set(data, forKey: Self.userDefaultsKey)
    }
}
