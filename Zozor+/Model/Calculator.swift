//
//  Calculator.swift
//  CountOnMe
//
//  Created by Mickael on 24/08/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculator {
    
    private var stringNumbers: [String] = [String()]
    
    private var operators: [String] = ["+"]
    
    private var error = String()
    
    private var total = 0
    
    // Ckecks if expression is correct. Returns Boolean. And saves errors...
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    error = "Démarrez un nouveau calcul ! "
                } else {
                    error = "Entrez une expression correcte !"
                }
                return false
            }
        }
        return true
    }
    
    // Get the total property
    func getTotal() -> Int {
        return total
    }
    
    // Get the error
    func getError() -> String {
        return error
    }
    
    // Get all operators tapped from user
    func getOperators() -> [String] {
        return operators
    }
    
    // Get all numbers tapped from user
    func getStringNumbers() -> [String]{
        return stringNumbers
    }
    
    // Add a number tapped from user. Save in String type
    func addStringNumber(number: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(number)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    // Check if operator can be added by user. Return a boolean.
    func canAddOperator(_ sign: String) -> Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if total == 0 {
                    return false
                } else {
                    addStringNumber(number: total)
                    clearTotal()
                }
            }
        }
        addOperator(sign)
        return true
    }
    
    // If previous method returns true then we can add operator.
    private func addOperator(_ sign: String) {
        operators.append(sign)
        stringNumbers.append("")
    }
    
    // Calculate total...
    func calculateTotal() -> Int {
        clearTotal()
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        return total
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
    
    func clearTotal() {
        total = 0
    }
}
