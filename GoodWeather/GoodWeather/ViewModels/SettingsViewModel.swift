//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

struct SettingsViewModel {
    
    private var unit: Unit = .celsius
    
    // MARK: - Properties
    var titles: [String] {
        return Unit.allCases.map{ $0.rawValue }
    }
    var selectedUnit: Unit {
        get { PreferenceManager.shared.loadUnitData() }
        set { unit = newValue }
    }
}

// MARK: - Helpers
extension SettingsViewModel {
    func numberOfRowsInSection() -> Int {
        return Unit.allCases.count
    }
    func saveSelectedUnit() {
        PreferenceManager.shared.saveUnitData(unit: unit)
    }
}
