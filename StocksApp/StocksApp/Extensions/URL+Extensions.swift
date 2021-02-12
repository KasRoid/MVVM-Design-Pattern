//
//  URL+Extensions.swift
//  StocksApp
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

extension URL {
    static var stocks: URL {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else { fatalError() }
        return url
    }
    static var topNews: URL {
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else { fatalError() }
        return url
    }
}
