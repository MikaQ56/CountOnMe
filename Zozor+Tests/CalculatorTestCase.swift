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
    
    func testGivenExpressionIsIncorrect_WhenEqualButtonTapped_ThenIsFalse() {
        calculator.addStringNumber(number: 2)
        if calculator.canAddOperator("+") {}
        XCTAssert(!calculator.isExpressionCorrect)
    }
    
    func testGivenExpressionIsEmpty_WhenEqualButtonTapped_ThenIsFalse() {
        XCTAssert(!calculator.isExpressionCorrect)
    }
    
    func testGivenExpressionIsCorrect_WhenEqualButtonTapped_ThenIsTrue() {
        calculator.addStringNumber(number: 2)
        if calculator.canAddOperator("+") {
            calculator.addStringNumber(number: 3)
        }
         XCTAssert(calculator.isExpressionCorrect)
    }
    
    func testGivenLastStringNumbersIsNotEmpty_WhenCanAddOperatorIsInvoked_ThenOperatorIsAdded() {
        
        var sign = String()
        calculator.addStringNumber(number: 2)
        if calculator.canAddOperator("+") {
           sign = calculator.getOperators()[1]
        }
        XCTAssertEqual(sign, "+")
    }
    
    func testGivenLastStringNumbersIsEmptyAndTotalIsZero_WhenCanAddOperatorIsInvoked_ThenOperatorIsNotAdded() {
        
        XCTAssert(!calculator.canAddOperator("+"))
    }
    
    func testGivenLastStringNumbersIsEmptyAndTotalNotNull_WhenCanAddOperatorIsInvoked_ThenOperatorIsTrue() {
        
        calculator.addStringNumber(number: 2)
        if calculator.canAddOperator("+") {
            calculator.addStringNumber(number: 3)
        }
        let total = calculator.calculateTotal()
        print(total)
        calculator.clear()
        XCTAssert(calculator.canAddOperator("+"))
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
    
    func testGivenIsError_WhenEqualButtonTapped_ThenErrorIsReturn() {
        calculator.addStringNumber(number: 2)
        if calculator.canAddOperator("+") {}
        if calculator.isExpressionCorrect {}
        XCTAssertEqual(calculator.getError(), "Entrez une expression correcte !")
    }
    
    func testGivenStringNumbersCountNotEmpty_WhenClearMethodIsInvoked_ThenStringNumbersIsEmpty() {
        calculator.addStringNumber(number: 2)
        calculator.clear()
        XCTAssertEqual(calculator.getStringNumbers(), [""])
        XCTAssertEqual(calculator.getOperators(), ["+"])
    }
    
    func testGivenExpressionIsCorrect_WhenEqualButtonTapped_ThenGetTotalMethodShouldReturn5 () {
        
        calculator.addStringNumber(number: 2)
        if calculator.canAddOperator("+") {
            calculator.addStringNumber(number: 3)
        }
        let result = calculator.calculateTotal()
        print(result)
        XCTAssertEqual(calculator.getTotal(), 5)
    }
}

