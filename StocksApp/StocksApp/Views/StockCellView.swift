//
//  StockCellView.swift
//  StocksApp
//
//  Created by Kas Song on 2/12/21.
//

import SwiftUI

struct StockCellView: View {
    
    let stock: Stock
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,
                   spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/,
                   content: {
                    Text(stock.symbol)
                        .font(.custom("Arial", size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    Text(stock.description)
                        .font(.custom("Arial", size: 18))
                        .foregroundColor(.gray)
            })
            Spacer()
            VStack(alignment: .center,
                   spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/,
                   content: {
                    Text("\(stock.price)")
                        .foregroundColor(.white)
                        .font(.custom("Arial", size: 22))
                    Button(stock.change, action: {})
                        .frame(width: 75)
                        .padding(5)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(6)
            })
        }
    }
}
