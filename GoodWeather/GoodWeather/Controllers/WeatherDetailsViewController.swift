//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by Kas Song on 2/13/21.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    // MARK: - Properties
    static let identifier = "WeatherDetailsViewController"
    final var viewModel = WeatherDetailsViewModel()
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.reloadData()
    }

    // MARK: - Helpers
    final func bindViewModel() {
        viewModel.name.bind { self.cityNameLabel.text = $0 }
        viewModel.temperature.bind { self.temperatureLabel.text = $0 }
        viewModel.minimumTemperature.bind { self.minimumTemperatureLabel.text = $0 }
        viewModel.maximumTemperature.bind { self.maximumTemperatureLabel.text = $0 }
    }
}
