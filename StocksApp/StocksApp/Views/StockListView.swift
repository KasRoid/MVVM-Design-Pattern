//
//  StockListView.swift
//  StocksApp
//
//  Created by Kas Song on 2/12/21.
//

import SwiftUI

struct StockListView: View {
    
    let viewModel: StockViewModel
    
    var body: some View {
        List(viewModel.stocks,
             id: \.symbol,
             rowContent: { stock in
                StockCellView(stock: stock)
             }
        )
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23")
        return StockListView(viewModel: StockViewModel(stocks: [stock]))
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}
