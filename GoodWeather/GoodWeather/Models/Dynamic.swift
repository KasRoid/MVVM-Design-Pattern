//
//  Dynamic.swift
//  GoodWeather
//
//  Created by Kas Song on 2/13/21.
//

import Foundation

final class Dynamic<T>: Decodable where T: Decodable {
    typealias Listener = (T) -> Void
    
    // MARK: - Properties
    final var listener: Listener?
    final var value: T {
        didSet { listener?(value) }
    }
    
    // MARK: - Lifecycle
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: - Helpers
    final func bind(listener: @escaping Listener) {
        self.listener = listener
    }
}

// MARK: - CodingKey
extension Dynamic {
    private enum CodingKeys: CodingKey {
        case value
    }
}
