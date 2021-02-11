//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - Selectors
extension OrdersTableViewController {
    @objc
    final private func didTapRightBarButtonItem(_ sender: UIBarButtonItem) {
        let nextVC = AddOrderViewController()
        let naviVC = UINavigationController(rootViewController: nextVC)
        naviVC.modalPresentationStyle = .fullScreen
        present(naviVC, animated: true, completion: nil)
    }
}

// MARK: - TableView Setup
extension OrdersTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 100
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UI
extension OrdersTableViewController {
    final private func setUI() {
        setNavigationBar()
        setBasics()
        setLayouts()
    }
    final private func setNavigationBar() {
        title = "Orders"
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapRightBarButtonItem(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    final private func setBasics() {
        
    }
    final private func setLayouts() {
        
    }
}
