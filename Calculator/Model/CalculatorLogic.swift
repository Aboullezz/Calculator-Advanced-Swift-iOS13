//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Mohamed Aboullezz on 29/01/2023.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation
struct CalculatorLogic {
    
    private var number:Double?
    // tubels ()
    private var intermediaCalculation: (n1: Double ,calcMethod: String )?
    mutating func setNumber (_ number:Double) {
        self.number = number
    }
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case"+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediaCalculation = (n1: n , calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation (n2: Double) -> Double? {
        if let n1 = intermediaCalculation?.n1 , let operation = intermediaCalculation?.calcMethod {
            switch operation {
            case "+" :
                return n1 + n2
            case "-" :
                return n1 - n2
            case "×" :
                return n1 * n2
            case "÷" :
                return n1 / n2
            default:
                fatalError("The Operation Passed in does not Match any of the Cases.")
            }
        }
        return nil
    }
}
