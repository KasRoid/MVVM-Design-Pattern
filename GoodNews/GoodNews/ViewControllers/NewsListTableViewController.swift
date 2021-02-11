//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Kas Song on 2/11/21.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    // MARK: - Properties
    final private var viewModel: ArticleViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadData()
    }
}

// MARK: - TableView Setup
extension NewsListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection() ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell else { fatalError() }
        viewModel?.configure(section: indexPath.section, index: indexPath.row)
        let title = viewModel?.title
        let description = viewModel?.description
        cell.configure(title: title, description: description)
        return cell
    }
}

// MARK: - Fetching Data
extension NewsListTableViewController {
    final private func loadData() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=\(Account.key)")!
        WebService.shared.getArticles(url: url, completion: { [weak self] articles in
            self?.viewModel = ArticleViewModel(articles: articles)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
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
    }
}
