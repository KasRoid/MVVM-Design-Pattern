//
//  StockViewModel.swift
//  StocksApp
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

struct StockViewModel {
    
    private let stocks: [Stock]
    var stock: Stock?
    
    // MARK: - Lifecycle
    init(stocks: [Stock]) {
        self.stocks = stocks
    }
}

// MARK: - Properties
extension StockViewModel {
    var symbol: String {
        return stock?.symbol.uppercased() ?? ""
    }
    var description: String {
        return stock?.description ?? ""
    }
    var price: String {
        return String(format: "%.2f", stock?.price ?? 0)
    }
    var change: String {
        return stock?.change ?? ""
    }
}
