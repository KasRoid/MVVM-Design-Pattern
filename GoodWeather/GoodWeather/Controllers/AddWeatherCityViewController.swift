//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import UIKit

class AddWeatherCityViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var cityNameTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Selectors
    @IBAction func didTapCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func didTapSaveButton(_ sender: UIButton) {
        guard let city = cityNameTextField.text else { return }
        let resource = Resource<Weather>(url: URL.generateWeatherURL(city: city))
        WeatherService.shared.load(resource: resource,
                                   completion: { result in
                                    switch result {
                                    case .success(let weather):
                                        print(weather)
                                    case .failure(let error):
                                        print(error)
                                    }
                                   })
    }
}
