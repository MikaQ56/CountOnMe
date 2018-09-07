//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

 // MARK: - Properties & outlets
class ViewController: UIViewController {
    
   
    var calculator = Calculator()

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
}

 // MARK: - Actions
extension ViewController {

    // When number button is tapped, then number is saved in Model & displayed on view
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                addNewNumber(i)
            }
        }
    }

    // When plus button is tapped, model checks if operator can be added. If ok, then the operator is saved in model & displayed on view. Else, an alert is displayed
    @IBAction func plus() {
        if calculator.canAddOperator("+") {
            updateDisplay()
        } else {
            alertOperators()
        }
    }

    // When minus button is tapped, model checks if operator can be added. If ok, then the operator is saved in model & displayed on view. Else, an alert is displayed
    @IBAction func minus() {
        if calculator.canAddOperator("-") {
            updateDisplay()
        } else {
            alertOperators()
        }
    }

    // When equal button is tapped, model checks if expression is correct. If OK, model calculate & display total. Else, an alert is displayed.
    @IBAction func equal() {
        if calculator.isExpressionCorrect {
            let total = calculator.calculateTotal()
            textView.text = textView.text + "=\(total)"
            calculator.clear()
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: calculator.getError(), preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    // When clear button is tapped, then total is reset.
    @IBAction func clearTotal() {
        calculator.clearTotal()
        updateDisplay()
    }
}

// MARK: - Alert
extension ViewController {
    
    // An alert is displayed when there is an error
    func alertOperators() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

// MARK: - Utilities
extension ViewController {

    func addNewNumber(_ newNumber: Int) {
        calculator.addStringNumber(number: newNumber)
        updateDisplay()
    }

    func updateDisplay() {
        var text = String()
        var operators = calculator.getOperators()
        let stringNumbers = calculator.getStringNumbers()
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }
    
}
