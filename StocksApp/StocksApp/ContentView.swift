//
//  ContentView.swift
//  StocksApp
//
//  Created by Kas Song on 2/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    private var viewModel = StockViewModel(stocks: [])
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        viewModel.fetchStocks()
    }
    
    var body: some View {
        let filteredStocks = viewModel.searchTerm.isEmpty
            ? viewModel.stocks
            : viewModel.stocks.filter { $0.symbol.starts(with: viewModel.searchTerm) }
        viewModel.stocks = filteredStocks
        
        return NavigationView {
            ZStack(alignment: .leading,
                   content: {
                    Color.black.edgesIgnoringSafeArea(.top)
                    Text("January 5 2020")
                        .font(.custom("Arial", size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        .offset(y: -335)
                    SearchView(searchTerm: $viewModel.searchTerm)
                        .offset(y: -280)
                    StockListView(viewModel: viewModel)
                        .offset(y: 100)
                   }
            )
            .navigationBarTitle("Stock")
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice((PreviewDevice(rawValue: "iPhone 12 Pro")))
        }
    }
}
