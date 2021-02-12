//
//  StockViewModel.swift
//  StocksApp
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

class StockViewModel: ObservableObject {
    
    @Published
    final var stocks: [Stock]
    @Published
    final var searchTerm = ""
    final var stock: Stock?
    
    init(stocks: [Stock]) {
        self.stocks = stocks
    }
}

// MARK: - Properties
extension StockViewModel {
    final var symbol: String {
        return stock?.symbol.uppercased() ?? ""
    }
    final var description: String {
        return stock?.description ?? ""
    }
    final var price: String {
        return String(format: "%.2f", stock?.price ?? 0)
    }
    final var change: String {
        return stock?.change ?? ""
    }
}

// MARK: - Helpers
extension StockViewModel {
    final func fetchStocks() {
        WebService.shared.getStocks(completion: { result in
            switch result {
            case .success(let stocks):
                print(#function, stocks)
                DispatchQueue.main.async {
                    self.stocks = stocks
                }
            case .failure(let error):
                print(error)
            }
        })
    }
}
