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
    
    var calculator = Calculator()
    
    override func setUp() {
        super.setUp()
        self.calculator = Calculator()
    }
    
    func testGivenLastStringNumbersIsNotEmpty_WhenCanAddOperatorIsInvoked_ThenOperatorIsAdded() {
        
        calculator.addStringNumber(number: 2)
        let result = calculator.canAddOperator("+")
        XCTAssert(result)
    }
    
    func testGivenStringNumbersAreTwoAndThree_WhenPlusAndEqualButtonsAreTapped_ThenResultShouldBe5 () {
        
        calculator.addStringNumber(number: 2)
        if calculator.canAddOperator("+") {
            calculator.addStringNumber(number: 3)
        }
        let result = calculator.calculateTotal()
        XCTAssertEqual(result, 5)
    }
    
    func testGivenStringNumbersAreTwoAndThree_WhenMinusAndEqualButtonsAreTapped_ThenResultShouldBe5 () {
        
        calculator.addStringNumber(number: 2)
        if calculator.canAddOperator("-") {
            calculator.addStringNumber(number: 3)
        }
        let result = calculator.calculateTotal()
        XCTAssertEqual(result, -1)
    }
    
    func testGivenLastStringNumbersIsempty_WhenSetStringNumbersIsInvoked_ThenStringNumbersIsEqualToOne() {
        
        calculator.addStringNumber(number: 1)
        XCTAssertEqual(calculator.getStringNumbers()[0], "1")
    }
    
}

