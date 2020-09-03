//
//  UpdatePasswordViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/21/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class UpdatePasswordViewController: BaseViewController {
    enum UpdatePasswordType {
        case Register
        case ForgetPassword
    }
    
    @IBOutlet weak var titleHeaderLabel: UILabel!
    @IBOutlet weak var otpTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var verifyPasswordTF: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var type: UpdatePasswordType = .Register
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch type {
        case .Register:
            titleHeaderLabel.text = "Nhập Mật Khẩu"
            break
        case .ForgetPassword:
            titleHeaderLabel.text = "Cập Nhật Mật Khẩu"
            break
        }
        
        otpTF.addTarget(self, action: #selector(phoneNumberTextFieldDidChangeValue(_:)), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(phoneNumberTextFieldDidChangeValue(_:)), for: .editingChanged)
        verifyPasswordTF.addTarget(self, action: #selector(phoneNumberTextFieldDidChangeValue(_:)), for: .editingChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        otpTF.becomeFirstResponder()
    }
    
    @objc private func phoneNumberTextFieldDidChangeValue(_ textField: UITextField) {
        if let text = textField.text {
            if text.isEmpty {
                nextButton.isEnabled = false
                nextButton.alpha = 0.5
            } else {
                nextButton.isEnabled = true
                nextButton.alpha = 1.0
            }
        }
    }
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
        guard let password = passwordTF.text, let verifyPassword = verifyPasswordTF.text else {
            return
        }
        if password.elementsEqual(verifyPassword) {
            let alert = UIAlertController(title: "Thông báo", message: "Cập nhật mật khẩu thành công.", preferredStyle: .alert)
            let doneAlertAction = UIAlertAction(title: "Done", style: .default) { (action) in
                AppDelegate.dismissToRootViewController({ (rootViewController) in
                    if self.type == .Register {
                        let viewController = HomeViewController.loadFromNib()
                        let navi = UINavigationController(rootViewController: viewController)
                        rootViewController?.present(navi, animated: true, completion: nil)
                    }
                })
            }
            alert.addAction(doneAlertAction)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Thông báo", message: "Mật khẩu xác nhận không trùng khớp.", preferredStyle: .alert)
            let doneAlertAction = UIAlertAction(title: "Done", style: .default)
            alert.addAction(doneAlertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelBtnAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
