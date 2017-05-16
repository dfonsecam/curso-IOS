//
//  ViewController.swift
//  Tarea#1
//
//  Created by Diego Fonseca Marín on 5/15/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {

    
    @IBOutlet weak var number1TextField: UITextField!
    @IBOutlet weak var number2TextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addition(_ sender: Any) {
        if validateFields() {
            let (number1, number2) = getValues()
            let result = number1 + number2
            printResult(result : result)
        }
    }
    
    @IBAction func subtraction(_ sender: Any) {
        if validateFields() {
            let (number1, number2) = getValues()
            let result = number1 - number2
            printResult(result : result)
        }
    }
    
    @IBAction func multiplication(_ sender: Any) {
        if validateFields() {
            let (number1, number2) = getValues()
            let result = number1 * number2
            printResult(result : result)
        }
    }
    @IBAction func division(_ sender: Any) {
        if validateFields() {
            let (number1, number2) = getValues()
            if number2 == 0 {
                resultLabel.text = "Invalid divisor"
                return
            }
            let result = number1 / number2
            printResult(result : result)
        }
    }
    
    func validateFields() -> Bool {
        let message = "Invalid numbers"
        guard let _ = Double(number1TextField.text!) else {
            resultLabel.text = message
            return false
        }
        guard let _ = Double(number2TextField.text!) else {
            resultLabel.text = message
            return false
        }
        return true
    }
    
    func getValues() -> (Double, Double) {
        let number1 = Double(number1TextField.text!)!
        let number2 = Double(number2TextField.text!)!
        return (number1, number2)
    }
    
    func printResult(result : Double) {
        let formatted = String(format: "%.02f", result)
        resultLabel.text="The result is:\n \(formatted)"
    }
    
}

