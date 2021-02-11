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
    var index: Int?
}

// MARK: - Properties
extension AddOrderViewModel {
    var type: String {
        guard let index = index else { fatalError() }
        return CoffeeType.allCases[index].rawValue.localizedCapitalized
    }
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.localizedCapitalized }
    }
}

// MARK: - Helpers
extension AddOrderViewModel {
    mutating func configure(index: Int) {
        self.index = index
    }
    func numberOfRowsInSection() -> Int {
        return CoffeeType.allCases.count
    }
}
