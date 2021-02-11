//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

struct ArticleViewModel {
    private let articles: [News.Article]
    private var section: Int?
    private var index: Int?
    
    init(articles: [News.Article]) {
        self.articles = articles
    }
}

extension ArticleViewModel {
    private var article: News.Article {
        guard let index = index else { fatalError() }
        return articles[index]
    }
    var title: String {
        return article.title
    }
    var description: String {
        return article.description ?? ""
    }
}

extension ArticleViewModel {
    mutating func configure(section: Int, index: Int) {
        self.section = section
        self.index = index
    }
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfRowsInSection() -> Int {
        return articles.count
    }
}
