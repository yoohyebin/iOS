//
//  LoginViewController.swift
//  LoginApp
//
//  Created by 유혜빈 on 2022/11/26.
//

import UIKit
import GoogleSignIn
import AuthenticationServices
import FirebaseAuth
import CryptoKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    fileprivate var currentNonce: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //이메일/비밀번호로 계속하기 버튼 UI
        self.emailLoginButton.layer.cornerRadius = 30
        self.emailLoginButton.layer.borderWidth = 1
        self.emailLoginButton.layer.borderColor = UIColor.white.cgColor
        
        //Google로 계속하기 버튼 UI
        self.googleLoginButton.layer.cornerRadius = 30
        self.googleLoginButton.layer.borderWidth = 1
        self.googleLoginButton.layer.borderColor = UIColor.white.cgColor
        
        //Apple로 계속하기 버튼 UI
        self.appleLoginButton.layer.cornerRadius = 30
        self.appleLoginButton.layer.borderWidth = 1
        self.appleLoginButton.layer.borderColor = UIColor.white.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Navigation Bar 가리기
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func googleLoginButtonAction(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {return}
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self){ user, error in
            guard error == nil else { return }
            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken
            else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
                        
            // 사용자 정보 등록
            Auth.auth().signIn(with: credential){_,_ in 
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
                mainViewController.modalPresentationStyle = .fullScreen
                self.navigationController?.show(mainViewController, sender: nil)
            }
        }
    }
    
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print ("Error Apple sign in: %@", error)
                    return
                }
                // User is signed in to Firebase with Apple.
                ///Main 화면으로 보내기
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
                mainViewController.modalPresentationStyle = .fullScreen
                self.navigationController?.show(mainViewController, sender: nil)
            }
        }
    }
}

//Apple Sign in
extension LoginViewController {
    func startSignInWithAppleFlow() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    // Adapted from
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
}

extension LoginViewController : ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

