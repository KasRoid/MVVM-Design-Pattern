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
    
    var name = Dynamic("")
    var temperature = Dynamic("")
    var minimumTemperature = Dynamic("")
    var maximumTemperature = Dynamic("")
    
    // MARK: - Helpers
    mutating func configure(weather: Weather?, unit: Unit) {
        self.weather = weather
        self.unit = unit
    }
    mutating func reloadData() {
        updateName()
        updateTemperature()
        updateMinimumTemperature()
        updateMaximumTemperature()
    }
}

extension WeatherDetailsViewModel {
    private mutating func updateName() {
        name.value = weather?.name.value ?? ""
    }
    private mutating func updateTemperature() {
        let value = weather?.temperature.current.value ?? 0
        temperature.value = calculateTemperature(value: value)
    }
    private mutating func updateMinimumTemperature() {
        let value = weather?.temperature.minimumTemperature.value ?? 0
        minimumTemperature.value = calculateTemperature(value: value)
    }
    private mutating func updateMaximumTemperature() {
        let value = weather?.temperature.maximumTemperature.value ?? 0
        maximumTemperature.value = calculateTemperature(value: value)
    }
    private func calculateTemperature(value: Double) -> String {
        switch unit {
        case .celsius:
            return Dynamic("\(value.formatAsCelsius())°").value
        case .fahrenheit:
            return Dynamic("\(value.formatAsFahrenheit())°").value
        }
    }
}
