//
//  PreferenceManager.swift
//  GoodWeather
//
//  Created by Kas Song on 2/13/21.
//

import Foundation

class PreferenceManager {
    
    // MARK: - Properties
    static let shared = PreferenceManager()
    
    // MARK: - Lifecycle
    private init() {}
    
    // MARK: - Helpers
    func saveUnitData(unit: Unit) {
        UserDefaults.standard.setValue(unit.rawValue, forKey: "unit")
    }
    func loadUnitData() -> Unit {
        let rawValue = UserDefaults.standard.string(forKey: "unit") ?? ""
        let unit = Unit(rawValue: rawValue) ?? .celsius
        return unit
    }
}
