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

// MARK: - TableView
extension NewsListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell else { fatalError() }
        cell.configure(title: "Title", description: "Description\nDescription")
        return cell
    }
}

// MARK: - UI
extension NewsListTableViewController {
    final private func setUI() {
        setBasics()
    }
    final private func setBasics() {
        title = "Good News"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=\(Account.key)")!
        WebService.shared.getArticles(url: url, completion: { articles in
            print(articles)
        })
    }
}
