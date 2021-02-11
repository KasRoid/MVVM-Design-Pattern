//
//  AddOrderViewModel.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

struct AddOrderViewModel {
    var name: String?
    var email: String?
    var selectedType: String?
    var selectedSize: String?
}

// MARK: - Properties
extension AddOrderViewModel {
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.localizedCapitalized }
    }
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.localizedCapitalized }
    }
}

// MARK: - Helpers
extension AddOrderViewModel {
    mutating func register(name: String?, email: String?, selectedType: String?, selectedSize: String?) {
        self.name = name
        self.email = email
        self.selectedType = selectedType
        self.selectedSize = selectedSize
    }
    func numberOfRowsInSection() -> Int {
        return CoffeeType.allCases.count
    }
}
