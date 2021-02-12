//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

struct SettingsViewModel {
    
}

// MARK: - Properties
extension SettingsViewModel {
    var titles: [String] {
        return Unit.allCases.map{ $0.rawValue }
    }
}

// MARK: - Helpers
extension SettingsViewModel {
    func numberOfRowsInSection() -> Int {
        return Unit.allCases.count
    }
}
