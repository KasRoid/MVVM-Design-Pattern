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
    final func getArticles(url: URL, completion: @escaping ([News.Article]) -> Void) {
        URLSession.shared.dataTask(with: url,
                                   completionHandler: { data, response, error in
                                    if let error = error {
                                        print("DataTask Error: ", error.localizedDescription)
                                    } else if let data = data {
                                        do {
                                            let news = try JSONDecoder().decode(News.self, from: data)
                                            let articles = news.articles
                                            completion(articles)
                                        } catch {
                                            print(error)
                                        }
                                    }
                                   }
        ).resume()
    }
}
