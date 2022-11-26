//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by 유혜빈 on 2022/11/25.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
  func changedSetting(text: String?, textColor: UIColor, backgroudColor: UIColor)
}

class SettingViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroudColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
      if let ledText = self.ledText {
        self.textField.text = ledText
      }
      self.changeTextColorButton(color: self.textColor)
      self.changeBackgroundColorButton(color: self.backgroudColor)
    }
    
    private func changeTextColorButton(color: UIColor) {
      self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
      self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
      self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }

    private func changeBackgroundColorButton(color: UIColor) {
      self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
      self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
      self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }

    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == yellowButton {
          self.textColor = .yellow
          self.changeTextColorButton(color: .yellow)
        } else if sender == purpleButton {
          self.textColor = .purple
          self.changeTextColorButton(color: .purple)
        } else {
          self.textColor = .green
          self.changeTextColorButton(color: .green)
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == blackButton {
          self.backgroudColor = .black
          self.changeBackgroundColorButton(color: .black)
        } else if sender == blueButton {
          self.backgroudColor = .blue
          self.changeBackgroundColorButton(color: .blue)
        } else {
          self.backgroudColor = .orange
          self.changeBackgroundColorButton(color: .orange)
        }
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
          text: self.textField.text,
          textColor: self.textColor,
          backgroudColor: self.backgroudColor
        )
        self.navigationController?.popViewController(animated: true)
    }
}
