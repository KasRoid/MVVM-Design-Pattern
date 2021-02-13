//
//  WeatherDetailsViewModel.swift
//  GoodWeather
//
//  Created by Kas Song on 2/13/21.
//

import Foundation

struct WeatherDetailsViewModel {
    // MARK: - Properties
    private var weather: Weather?
    private var unit: Unit = .celsius
    
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
    var minimumTemperature: String {
        switch unit {
        case .celsius:
            return "\(weather?.temperature.minimumTemperature.formatAsCelsius() ?? "")°"
        case .fahrenheit:
            return "\(weather?.temperature.minimumTemperature.formatAsFahrenheit() ?? "")°"
        }
    }
    var maximumTemperature: String {
        switch unit {
        case .celsius:
            return "\(weather?.temperature.maximumTemperature.formatAsCelsius() ?? "")°"
        case .fahrenheit:
            return "\(weather?.temperature.maximumTemperature.formatAsFahrenheit() ?? "")°"
        }
    }
    
    // MARK: - Helpers
    mutating func setWeather(weather: Weather?) {
        self.weather = weather
    }
}
