//
//  ForgetPasswordViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/21/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: BaseViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 5.0
        
        phoneNumberTF.addTarget(self, action: #selector(phoneNumberTextFieldDidChangeValue(_:)), for: .editingChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        phoneNumberTF.becomeFirstResponder()
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
        
    }

    @IBAction func cancelBtnAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
