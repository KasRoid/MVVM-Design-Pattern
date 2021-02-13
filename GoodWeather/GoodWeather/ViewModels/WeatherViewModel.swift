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
            return temperatureInCelsius
        case .fahrenheit:
            return temperatureInFahrenheit
        }
    }
    private var temperatureInCelsius: String {
        let temperature = weather?.temperature.current.formatAsCelsius() ?? ""
        let result = "\(temperature)°"
        return result
    }
    private var temperatureInFahrenheit: String {
        let temperature = weather?.temperature.current.formatAsFahrenheit() ?? ""
        let result = "\(temperature)°"
        return result
    }
}

// MARK: - Helpers
extension WeatherViewModel {
    func numberOfRowsInSection() -> Int {
        return weathers.count
    }
    mutating func addWeather(_ weather: Weather) {
        weathers.append(weather)
    }
    mutating func setWeather(index: Int) {
        weather = weathers[index]
    }
}
