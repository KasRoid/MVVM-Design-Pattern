//
//  WebService.swift
//  StocksApp
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

class WebService {
    
    // MARK: - Properties
    static let shared = WebService()
    
    // MARK: - Lifecycle
    private init() {}
}

extension WebService {
    final func getStocks(completion: @escaping (Result<[Stock], Error>) -> Void) {
        URLSession.shared.dataTask(with: URL.stocks,
                                   completionHandler: { data, response, error in
                                    if let error = error {
                                        completion(.failure(error))
                                    } else if let data = data {
                                        do {
                                            let stocks = try JSONDecoder().decode([Stock].self, from: data)
                                            completion(.success(stocks))
                                        } catch {
                                            completion(.failure(error))
                                        }
                                    }
                                   }).resume()
    }
}
