//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    // MARK: - Properties
    private var viewModel = WeatherViewModel()
    
    // MARK: - Lifecycle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch segue.identifier {
        case "AddWeatherCityViewController":
            prepareSegueForAddWeatherCityViewController(segue: segue)
        case "SettingsTableViewController":
            prepareSegueForSettingsTableViewController(segue: segue)
        default:
            fatalError()
        }
    }
}

// MARK: - Helpers
extension WeatherListTableViewController {
    final private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let naviVC = segue.destination as? UINavigationController,
              let destVC = naviVC.viewControllers.first as? AddWeatherCityViewController else { return }
        destVC.delegate = self
    }
    final private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        
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
        cell.temperatureLabel.text = viewModel.temperatureInCelsius
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
