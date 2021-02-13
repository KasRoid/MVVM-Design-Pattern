//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    // MARK: - Properties
    static let identifier = "SettingsTableViewController"
    final weak var delegate: SettingsTableViewControllerDelegate?
    final private var viewModel = SettingsViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Selectors
    @IBAction func didTapDoneButton(_ sender: UIBarButtonItem) {
        viewModel.saveSelectedUnit()
        delegate?.didUpdateUnit(unit: viewModel.selectedUnit)
        dismiss(animated: true)
    }
}

// MARK: - TableView Delegate
extension SettingsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        tableView.visibleCells.forEach { $0.accessoryType = .none }
        cell.accessoryType = .checkmark
        let unit = Unit.allCases[indexPath.row]
        viewModel.selectedUnit = unit
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = .none
    }
}

// MARK: - TableView DataSource
extension SettingsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.titles[indexPath.row]
        if Unit.allCases[indexPath.row] == viewModel.selectedUnit {
            viewModel.selectedUnit = Unit.allCases[indexPath.row]
            cell.accessoryType = .checkmark
        }
        return cell
    }
}

// MARK: - Protocols
protocol SettingsTableViewControllerDelegate: class {
    func didUpdateUnit(unit: Unit)
}
