//
//  TableViewDataSource.swift
//  GoodWeather
//
//  Created by Kas Song on 2/13/21.
//

import UIKit

final class TableViewDataSource<Cell, ViewModel>: NSObject, UITableViewDataSource where Cell: UITableViewCell {
    
    // MARK: - Properties
    final private let identifier: String
    final private var items: [ViewModel]
    final private let configure: (Cell, ViewModel) -> Void
    
    // MARK: - Lifecycle
    init(identifier: String, items: [ViewModel], configure: @escaping (Cell, ViewModel) -> Void) {
        self.identifier = identifier
        self.items = items
        self.configure = configure
    }
    
    final func updateItems(_ items: [ViewModel]) {
        self.items = items
    }
    
    // MARK: - Helpers
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else { fatalError() }
        let viewModel = items[indexPath.row]
        configure(cell, viewModel)
        return cell
    }
}
