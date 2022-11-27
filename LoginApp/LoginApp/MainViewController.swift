//
//  MainViewController.swift
//  LoginApp
//
//  Created by 유혜빈 on 2022/11/26.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
        let displayName = Auth.auth().currentUser?.email ?? ""
        
        self.welcomeLabel.text = """
            환영합니다.
            \(displayName)님
            """
        
        let isEmailSignIn = Auth.auth().currentUser?.providerData[0].providerID == "password"
        self.resetPasswordButton.isHidden = !isEmailSignIn
    }
    
    @IBAction func tapProfileUpdateButton(_ sender: UIButton) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = "토끼"
        changeRequest?.commitChanges { _ in
            let displayName = Auth.auth().currentUser?.displayName ?? Auth.auth().currentUser?.email ?? ""
            self.welcomeLabel.text = """
            환영합니다.
            \(displayName)님
            """
        }
    }
    
    @IBAction func tapResetPasswordButton(_ sender: UIButton) {
        let email = Auth.auth().currentUser?.email ?? ""
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
    }
    
    @IBAction func tapLogoutButton(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
