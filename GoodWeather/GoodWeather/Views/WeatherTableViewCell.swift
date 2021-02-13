//
//  WeatherTableViewCell.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "WeatherTableViewCell"
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
}
