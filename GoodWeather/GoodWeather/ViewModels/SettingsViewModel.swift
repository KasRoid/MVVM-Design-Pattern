//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

struct SettingsViewModel {
    
    private var units: Unit = .celsius
    
    // MARK: - Properties
    var titles: [String] {
        return Unit.allCases.map{ $0.rawValue }
    }
    var selectedUnit: Unit {
        get {
            if let rawValue = UserDefaults.standard.string(forKey: "unit"),
               let unit = Unit(rawValue: rawValue)  {
                return unit
            } else {
                return units
            }
        }
        set { units = newValue }
    }
}

// MARK: - Helpers
extension SettingsViewModel {
    func numberOfRowsInSection() -> Int {
        return Unit.allCases.count
    }
    func saveSelectedUnit() {
        UserDefaults.standard.setValue(units.rawValue, forKey: "unit")
    }
}
