//
//  Weather.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

struct Weather: Decodable {
    let name: Dynamic<String>
    let temperature: Temperature
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        temperature = try container.decode(Temperature.self, forKey: .temperature)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case temperature = "main"
    }
    
    // MARK: - Temperature
    struct Temperature: Decodable {
        let current: Dynamic<Double>
        let minimumTemperature: Dynamic<Double>
        let maximumTemperature: Dynamic<Double>
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            current = try Dynamic(container.decode(Double.self, forKey: .current))
            minimumTemperature = try Dynamic(container.decode(Double.self, forKey: .minimumTemperature))
            maximumTemperature = try Dynamic(container.decode(Double.self, forKey: .maximumTemperature))
        }
        
        private enum CodingKeys: String, CodingKey {
            case current = "temp"
            case minimumTemperature = "temp_min"
            case maximumTemperature = "temp_max"
        }
    }
}
