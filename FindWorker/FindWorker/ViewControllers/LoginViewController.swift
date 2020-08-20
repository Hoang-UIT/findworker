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
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5.0
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        print("login")
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        print("register")
    }
    
    @IBAction func skipBtnAction(_ sender: UIButton) {
        print("skip")
    }
}
