//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    // MARK: - Properties
    final private var viewModel: OrderViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadOrders()
    }
}

// MARK: - Load Data
extension OrdersTableViewController {
    final private func loadOrders() {
        OrderService.shared.load(resource: Order.all,
                                 completion: { [weak self] result in
                                    switch result {
                                    case .success(let orders):
                                        self?.viewModel = OrderViewModel(orders: orders)
                                        DispatchQueue.main.async {
                                            self?.tableView.reloadData()
                                        }
                                    case .failure(let error):
                                        print(error)
                                    }
                                 })
    }
}

// MARK: - Selectors
extension OrdersTableViewController {
    @objc
    final private func didTapRightBarButtonItem(_ sender: UIBarButtonItem) {
        let viewModel = AddOrderViewModel()
        let nextVC = AddOrderViewController(viewModel: viewModel)
        let naviVC = UINavigationController(rootViewController: nextVC)
        naviVC.modalPresentationStyle = .fullScreen
        present(naviVC, animated: true, completion: nil)
    }
}

// MARK: - TableView Setup
extension OrdersTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection() ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        viewModel?.configure(index: indexPath.row)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = viewModel?.type
        contentConfiguration.secondaryText = viewModel?.size
        contentConfiguration.prefersSideBySideTextAndSecondaryText = true
        cell.contentConfiguration = contentConfiguration
        return cell
    }
}

// MARK: - UI
extension OrdersTableViewController {
    final private func setUI() {
        setNavigationBar()
        setBasics()
    }
    final private func setNavigationBar() {
        title = "Orders"
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapRightBarButtonItem(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    final private func setBasics() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
