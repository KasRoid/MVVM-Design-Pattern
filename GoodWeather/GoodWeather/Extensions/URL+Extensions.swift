//
//  URL+Extensions.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

extension URL {
    static func generateWeatherURL(city: String) -> URL {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(Account.apiKey)") else { fatalError() }
        return url
    }
}
