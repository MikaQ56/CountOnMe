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
    
    func canAddOperator(_ test: String) -> Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        operators.append(test)
        stringNumbers.append("")
        return true
    }
    
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
    
    func getError() -> String {
        return error
    }
    
    func getOperators() -> [String] {
        return operators
    }
    
    func getStringNumbers() -> [String]{
        return stringNumbers
    }
    
    func updateStringNumbers(addNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(addNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func calculateTotal() -> Int {
        var total = 0
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
}
