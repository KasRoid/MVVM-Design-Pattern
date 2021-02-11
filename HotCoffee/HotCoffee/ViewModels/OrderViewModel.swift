//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

struct OrderViewModel {
    private let data: [Order]
    private var index: Int?
    private var order: Order {
        guard let index = index else { fatalError() }
        return data[index]
    }
    
    init(orders data: [Order]) {
        self.data = data
    }
}

// MARK: - Properties
extension OrderViewModel {
    var name: String {
        return order.name
    }
    var email: String {
        return order.email
    }
    var type: String {
        return order.type.rawValue
    }
    var size: String {
        return order.size.rawValue
    }
}

// MARK: - Helpers
extension OrderViewModel {
    mutating func configure(index: Int) {
        self.index = index
    }
    func numberOfRowsInSection() -> Int {
        return data.count
    }
}
