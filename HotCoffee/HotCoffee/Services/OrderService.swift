//
//  OrderService.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

class OrderService {
    
    // MARK: - Properties
    static let shared = OrderService()
    
    // MARK: - Lifecycle
    private init() {}
}

extension OrderService {
    final func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        var request = URLRequest(url: URL.coffeeOrder)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request,
                                   completionHandler: { data, response, error in
                                    guard let data = data, error == nil else {
                                        completion(.failure(.domainError))
                                        return
                                    }
                                    do {
                                        let result = try JSONDecoder().decode(T.self, from: data)
                                        completion(.success(result))
                                    } catch {
                                        completion(.failure(.decodingError))
                                        print(error)
                                    }
                                   }
        ).resume()
    }
}
