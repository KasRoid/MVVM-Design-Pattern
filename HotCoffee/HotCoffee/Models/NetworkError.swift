//
//  NetworkError.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}
