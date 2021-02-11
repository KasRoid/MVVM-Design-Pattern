//
//  Resource.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var httpBody: Data? = nil
}
