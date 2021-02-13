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
    private var dataSource: TableViewDataSource<WeatherTableViewCell, Weather>!
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        viewModel = WeatherViewModel()
        super.init(coder: coder)
        viewModel.unit = PreferenceManager.shared.loadUnitData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = TableViewDataSource(identifier: WeatherTableViewCell.identifier,
                                         items: viewModel.weathers,
                                         configure: { [weak self] cell, weather in
                                            self?.viewModel.setWeather(weather: weather)
                                            cell.cityNameLabel.text = self?.viewModel.name.value
                                            cell.temperatureLabel.text = self?.viewModel.temperature.value
                                         })
        tableView.dataSource = dataSource
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        prepareForSegue(segue: segue)
    }
}

// MARK: - Helpers
extension WeatherListTableViewController {
    final private func prepareForSegue(segue: UIStoryboardSegue) {
        switch segue.identifier {
        case AddWeatherCityViewController.identifier:
            guard let naviVC = segue.destination as? UINavigationController,
                  let destVC = naviVC.viewControllers.first as? AddWeatherCityViewController else { return }
            destVC.delegate = self
        case SettingsTableViewController.identifier:
            guard let naviVC = segue.destination as? UINavigationController,
                  let destVC = naviVC.viewControllers.first as? SettingsTableViewController else { return }
            destVC.delegate = self
        case WeatherDetailsViewController.identifier:
            guard let destVC = segue.destination as? WeatherDetailsViewController,
                  let index = tableView.indexPathForSelectedRow?.row else { return }
            let weather = viewModel.getWeather(index: index)
            destVC.viewModel.configure(weather: weather, unit: viewModel.unit)
        default:
            fatalError()
        }
    }
}

// MARK: - AddWeatherCityViewControllerDelegate
extension WeatherListTableViewController: AddWeatherCityViewControllerDelegate {
    func didSaveWeather(weather: Weather) {
        viewModel.addWeather(weather)
        dataSource.updateItems(viewModel.weathers)
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
