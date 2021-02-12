//
//  Weather.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

struct Weather: Decodable {
    
    let name: String
    let temperature: Temperature
    
    private enum CodingKeys: String, CodingKey {
        case name
        case temperature = "main"
    }
    
    struct Temperature: Decodable {
        let current: Double
        
        private enum CodingKeys: String, CodingKey {
            case current = "temp"
        }
    }
}
