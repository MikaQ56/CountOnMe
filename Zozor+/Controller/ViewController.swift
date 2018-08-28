//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var calculator = Calculator()

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                addNewNumber(i)
            }
        }
    }

    @IBAction func plus() {
        if calculator.canAddOperator("+") {
            updateDisplay()
        } else {
            alertOperators()
        }
    }

    @IBAction func minus() {
        if calculator.canAddOperator("-") {
            updateDisplay()
        } else {
            alertOperators()
        }
    }

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
    
    @IBAction func clearTotal() {
        calculator.clearTotal()
        updateDisplay()
    }

    // MARK: - Methods
    
    func alertOperators() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

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
