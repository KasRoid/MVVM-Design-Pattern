//
//  News.swift
//  GoodNews
//
//  Created by Kas Song on 2/11/21.
//

import Foundation

struct News: Decodable {
    
    let articles: [Article]
    
    struct Article: Decodable {
        let title: String
        let description: String?
    }
}
