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
}
