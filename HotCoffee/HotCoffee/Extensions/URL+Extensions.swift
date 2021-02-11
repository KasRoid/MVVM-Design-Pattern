//
//  URL+Extensions.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

extension URL {
    static var coffeeOrder: URL {
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else { fatalError() }
        return url
    }
}
