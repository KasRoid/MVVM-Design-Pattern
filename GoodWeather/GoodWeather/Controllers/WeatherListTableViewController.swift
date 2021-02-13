//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    // MARK: - Properties
    private var viewModel: WeatherViewModel
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        viewModel = WeatherViewModel()
        super.init(coder: coder)
        viewModel.unit = PreferenceManager.shared.loadUnitData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        prepareForSegue(segue: segue)
    }
}

// MARK: - Helpers
extension WeatherListTableViewController {
    final private func prepareForSegue(segue: UIStoryboardSegue) {
        guard let naviVC = segue.destination as? UINavigationController else { return }
        switch segue.identifier {
        case "AddWeatherCityViewController":
            guard let destVC = naviVC.viewControllers.first as? AddWeatherCityViewController else { return }
            destVC.delegate = self
        case "SettingsTableViewController":
            guard let destVC = naviVC.viewControllers.first as? SettingsTableViewController else { return }
            destVC.delegate = self
        default:
            fatalError()
        }
    }
}

// MARK: - TableView DataSource
extension WeatherListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell else { fatalError() }
        viewModel.setWeather(index: indexPath.row)
        cell.cityNameLabel.text = viewModel.name
        cell.temperatureLabel.text = viewModel.temperature
        return cell
    }
}

// MARK: - AddWeatherCityViewControllerDelegate
extension WeatherListTableViewController: AddWeatherCityViewControllerDelegate {
    func didSaveWeather(weather: Weather) {
        viewModel.addWeather(weather)
        tableView.reloadData()
    }
}

// MARK: - SettingsTableViewControllerDelegate
extension WeatherListTableViewController: SettingsTableViewControllerDelegate {
    func didUpdateUnit(unit: Unit) {
        viewModel.unit = unit
        tableView.reloadData()
    }
}
