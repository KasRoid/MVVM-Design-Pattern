//
//  Order.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
    
    init?(viewModel: AddOrderViewModel) {
        guard let name = viewModel.name,
              let email = viewModel.email,
              let selectedType = viewModel.selectedType,
              let selectedSize = viewModel.selectedSize,
              let type = CoffeeType(rawValue: selectedType.lowercased()),
              let size = CoffeeSize(rawValue: selectedSize.lowercased()) else { return nil }
        self.name = name
        self.email = email
        self.type = type
        self.size = size
    }
}

extension Order {
    static var all: Resource<[Order]> {
        return Resource<[Order]>(url: URL.coffeeOrder)
    }
    static func createResource(viewModel: AddOrderViewModel) -> Resource<Order> {
        let order = Order(viewModel: viewModel)
        do {
            let data = try JSONEncoder().encode(order)
            var resource = Resource<Order>(url: URL.coffeeOrder)
            resource.httpMethod = .post
            resource.httpBody = data
            return resource
        } catch {
            print("Encoding Error: ", error)
            fatalError()
        }
    }
}
