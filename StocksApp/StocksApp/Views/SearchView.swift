//
//  SearchView.swift
//  StocksApp
//
//  Created by Kas Song on 2/12/21.
//

import SwiftUI

struct SearchView: View {
    
    @Binding
    var searchTerm: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchTerm)
                .foregroundColor(.primary)
                .padding(10)
            Spacer()
        }
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
        .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}
