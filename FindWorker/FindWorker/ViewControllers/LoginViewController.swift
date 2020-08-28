//
//  LoginViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/20/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.addTarget(self, action: #selector(phoneNumberTextFieldDidChangeValue(_:)), for: .editingChanged)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userNameTF.becomeFirstResponder()
    }
    
    
    @objc private func phoneNumberTextFieldDidChangeValue(_ textField: UITextField) {
        if let text = textField.text {
            if text.isEmpty {
                loginButton.isEnabled = false
                loginButton.alpha = 0.5
            } else {
                loginButton.isEnabled = true
                loginButton.alpha = 1.0
            }
        }
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        print("login")
        let homeViewController = HomeViewController.instantiateViewController(Constants.StoryboardID.homeScreen)
        let navi = UINavigationController(rootViewController: homeViewController)
        present(navi, animated: true, completion: nil)
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        print("register")
    }
    
    @IBAction func forgetPasswordBtnAction(_ sender: UIButton) {
        print("Forget password")
    }
    
    @IBAction func skipBtnAction(_ sender: UIButton) {
        print("skip")
        let homeViewController = HomeViewController.instantiateViewController(Constants.StoryboardID.homeScreen)
        let navi = UINavigationController(rootViewController: homeViewController)
        present(navi, animated: true, completion: nil)
    }
}
