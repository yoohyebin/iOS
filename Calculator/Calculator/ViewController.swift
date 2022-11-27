//
//  ViewController.swift
//  Calculator
//
//  Created by 유혜빈 on 2022/11/25.
//

import UIKit

enum Operation {
  case Add
  case Subtract
  case Divide
  case Multiply
  case unknown
}

class ViewController: UIViewController {
    @IBOutlet weak var numLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func operation(_ operation: Operation) {
      if self.currentOperation != .unknown {
        if !self.displayNumber.isEmpty {
          self.secondOperand = self.displayNumber
          self.displayNumber = ""

          guard let firstOperand = Double(self.firstOperand) else { return }
          guard let secondOperand = Double(self.secondOperand) else { return }

          switch self.currentOperation {
          case .Add:
            self.result = "\(firstOperand + secondOperand)"

          case .Subtract:
            self.result = "\(firstOperand - secondOperand)"

          case .Divide:
            self.result = "\(firstOperand / secondOperand)"

          case .Multiply:
            self.result = "\(firstOperand * secondOperand)"

          default:
            break
          }

          if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
            self.result = "\(Int(result))"
          }

          self.firstOperand = self.result
          self.numLabel.text = self.result
        }

        self.currentOperation = operation
      } else {
        self.firstOperand = self.displayNumber
        self.currentOperation = operation
        self.displayNumber = ""
      }
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
          self.displayNumber += numberValue
          self.numLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
          self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
          self.numLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        switch sender.titleLabel!.text{
        case "÷":
            self.operation(.Divide)
        case "x":
            self.operation(.Multiply)
        case "-":
            self.operation(.Subtract)
        case "+":
            self.operation(.Add)
        case "=":
            self.operation(self.currentOperation)
        default:
            break
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numLabel.text = "0"
    }
    
}

