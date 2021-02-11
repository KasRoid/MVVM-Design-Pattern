//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

struct OrderViewModel {
    private let orders: [Order]
    private var order: Order?
    
    init(orders: [Order]) {
        self.orders = orders
    }
}

// MARK: - Properties
extension OrderViewModel {
    var name: String {
        guard let order = order else { fatalError() }
        return order.name
    }
    var email: String {
        guard let order = order else { fatalError() }
        return order.email
    }
    var type: String {
        guard let order = order else { fatalError() }
        return order.type.rawValue
    }
    var size: String {
        guard let order = order else { fatalError() }
        return order.size.rawValue
    }
}

// MARK: - Helpers
extension OrderViewModel {
    mutating func configure(index: Int) {
        order = orders[index]
    }
    func numberOfRowsInSection() -> Int {
        return orders.count
    }
}
