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
    
    func getTotal() -> Int {
        return total
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
    
    func addStringNumber(number: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(number)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func canAddOperator(_ sign: String) -> Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty && total == 0 {
                return false
            }
        }
        addOperator(sign)
        return true
    }
    
    private func addOperator(_ sign: String) {
        operators.append(sign)
        stringNumbers.append("")
    }
    
    func calculateTotal() -> Int {
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
