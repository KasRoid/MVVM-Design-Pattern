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
        title = "Good News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
