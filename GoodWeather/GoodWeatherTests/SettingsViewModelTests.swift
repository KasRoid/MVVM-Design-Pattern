//
//  SettingsViewModelTests.swift
//  GoodWeatherTests
//
//  Created by Kas Song on 2021/03/18.
//

import XCTest
@testable import GoodWeather

class SettingsViewModelTests: XCTestCase {

    // MARK: - Properties
    private var viewModel: SettingsViewModel?
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        viewModel = SettingsViewModel()
    }
    override func tearDownWithError() throws {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
    
    // MARK: - Helpers
    func test_should_return_correct_display_name_for_fahrenheit() {
        XCTAssertEqual(viewModel?.selectedUnit.rawValue, "Celsius")
    }
    func test_should_make_sure_that_default_selected_unit_is_fahrenheit() {
        XCTAssertEqual(viewModel?.selectedUnit, .celsius)
    }
    func test_should_be_able_to_save_user_unit_selection() {
        viewModel?.selectedUnit = .fahrenheit
        let userDefaults = UserDefaults.standard
        XCTAssertNil(userDefaults.value(forKey: "unit"))
    }
}
