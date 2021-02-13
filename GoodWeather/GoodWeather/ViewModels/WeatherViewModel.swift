//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

struct WeatherViewModel {
    private var weathers: [Weather] = []
    private var weather: Weather?
    var unit: Unit = .celsius
}

// MARK: - Properties
extension WeatherViewModel {
    var name: String {
        return weather?.name ?? ""
    }
    var temperature: String {
        switch unit {
        case .celsius:
            return "\(weather?.temperature.current.formatAsCelsius() ?? "")°"
        case .fahrenheit:
            return "\(weather?.temperature.current.formatAsFahrenheit() ?? "")°"
        }
    }
}

// MARK: - Helpers
extension WeatherViewModel {
    func numberOfRowsInSection() -> Int {
        return weathers.count
    }
    func getWeather(index: Int) -> Weather {
        return weathers[index]
    }
    mutating func addWeather(_ weather: Weather) {
        weathers.append(weather)
    }
    mutating func setWeather(index: Int) {
        weather = weathers[index]
    }
}
