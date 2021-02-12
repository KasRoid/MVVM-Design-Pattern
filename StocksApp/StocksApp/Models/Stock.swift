//
//  Stock.swift
//  StocksApp
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
