//
//  AddAlertViewController.swift
//  DrinkNotice
//
//  Created by 유혜빈 on 2022/11/27.
//

import UIKit

class AddAlertViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var datePicked: ((_ date: Date) -> Void)?
    
    @IBAction func tapDismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapSaveButton(_ sender: UIBarButtonItem) {
        datePicked?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
}
