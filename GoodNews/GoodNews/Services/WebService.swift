//
//  WebService.swift
//  GoodNews
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

final class WebService {
    
    // MARK: - Properties
    static let shared = WebService()
    
    // MARK: - Lifecycle
    private init() {}
}

extension WebService {
    final func getArticles(url: URL) {
        URLSession.shared.dataTask(with: url,
                                   completionHandler: { data, response, error in
                                    if let error = error {
                                        print(error)
                                    } else if let data = data {
                                        print(data)
                                    }
                                   }
        ).resume()
    }
}
