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
}

// MARK: - Properties
extension WeatherViewModel {
    var name: String {
        return weather?.name ?? ""
    }
    var temperature: String {
        let temperature = weather?.temperature.current ?? 0
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
