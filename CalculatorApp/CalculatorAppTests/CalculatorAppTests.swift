//
//  CalculatorAppTests.swift
//  CalculatorAppTests
//
//  Created by Kas Song on 2021/03/18.
//

import XCTest
@testable import CalculatorApp

class CalculatorAppTests: XCTestCase {
    
    private var calculator: Calculator! = Calculator()
    
    override func setUpWithError() throws {
        calculator = Calculator()
    }
    
    override func tearDownWithError() throws {
        print(#function)
    }
    
    func test_AddTwoNumbers() {
        let result = calculator.add(2, 3)
        XCTAssertEqual(result, 5)
    }
    
    func test_SubtractTwoNumbers() {
        let result = calculator.subtract(5, 2)
        XCTAssertEqual(result, 3)
    }
}
