//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by Mickael on 25/08/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatorTestCase: XCTestCase {
    
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        self.calculator = Calculator()
    }
    
    func testGivenLastStringNumbersIsNotEmpty_WhenCanAddOperatorIsInvoked_ThenOperatorIsAdded() {
        
        var sign = String()
        calculator.addStringNumber(number: 2)
        if calculator.canAddOperator("+") {
           sign = calculator.getOperators()[1]
        }
        XCTAssertEqual(sign, "+")
    }
    
    func testGivenStringNumbersAreTwoAndThree_WhenPlusAndEqualButtonsAreTapped_ThenResultShouldBe5 () {
        
        calculator.addStringNumber(number: 2)
        if calculator.canAddOperator("+") {
            calculator.addStringNumber(number: 3)
        }
        let result = calculator.calculateTotal()
        XCTAssertEqual(result, 5)
    }
    
    func testGivenStringNumbersAreFourAndThree_WhenMinusAndEqualButtonsAreTapped_ThenResultShouldBe1 () {
        
        calculator.addStringNumber(number: 4)
        if calculator.canAddOperator("-") {
            calculator.addStringNumber(number: 3)
        }
        let result = calculator.calculateTotal()
        XCTAssertEqual(result, 1)
    }
    
    func testGivenLastStringNumbersIsempty_WhenSetStringNumbersIsInvoked_ThenStringNumbersIsEqualToOne() {
        
        calculator.addStringNumber(number: 1)
        XCTAssertEqual(calculator.getStringNumbers()[0], "1")
    }
    
}

