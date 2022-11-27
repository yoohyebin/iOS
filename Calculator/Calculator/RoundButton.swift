//
//  RoundButton.swift
//  Calculator
//
//  Created by 유혜빈 on 2022/11/25.
//

import UIKit

@IBDesignable
class RoundButton: UIButton{
    @IBInspectable var isRound: Bool = false {
      didSet {
        if isRound {
          self.layer.cornerRadius = self.frame.height / 2
        }
      }
    }
  }
