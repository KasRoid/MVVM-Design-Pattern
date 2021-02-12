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
        
    }
}
