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
        setLabels()
    }

    // MARK: - Helpers
    final func setLabels() {
        cityNameLabel.text = viewModel.name
        temperatureLabel.text = viewModel.temperature
        minimumTemperatureLabel.text = viewModel.minimumTemperature
        maximumTemperatureLabel.text = viewModel.maximumTemperature
    }
}
