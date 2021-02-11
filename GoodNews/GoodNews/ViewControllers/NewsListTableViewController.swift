//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Kas Song on 2/11/21.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - UI
extension NewsListTableViewController {
    final private func setUI() {
        setBasics()
    }
    final private func setBasics() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=\(Account.key)")!
        title = "Good News"
        navigationController?.navigationBar.prefersLargeTitles = true
        WebService.shared.getArticles(url: url)
    }
}
