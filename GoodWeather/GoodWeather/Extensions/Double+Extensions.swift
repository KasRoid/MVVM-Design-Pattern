//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

extension Double {
    func formatAsCelsius() -> String {
        let result = self - 273.15
        return String(format: "%.0f", result)
    }
    func formatAsFahrenheit() -> String {
        let result = (self - 273.15) * 9/5 + 32
        return String(format: "%.0f", result)
    }
}
