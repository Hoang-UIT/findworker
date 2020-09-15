//
//  UserInfoViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class UserInfoViewController: BaseViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var addressTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleViewController = "Thông Tin Người Dùng"
        
        emailTextField.isEnabled = false
        emailTextField.delegate = self
        
        phoneNumberTextField.isEnabled = false
        phoneNumberTextField.delegate = self
        
        addressTextView.isEditable = false
        addressTextView.delegate = self
        addressTextView.translatesAutoresizingMaskIntoConstraints = true
        addressTextView.sizeToFit()
        addressTextView.isScrollEnabled = false
    }
    
    @IBAction func updatePasswordBtnAction (sender: UIButton) {
        if let viewController = UpdatePasswordViewController.instantiateViewController(Constants.StoryboardID.updatePasswordScreen) as? UpdatePasswordViewController {
           present(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func emailBtnAction(_ sender: UIButton) {
        emailTextField.isEnabled = true
        emailTextField.becomeFirstResponder()
    }
    
    @IBAction func phoneBtnAction(_ sender: UIButton) {
        phoneNumberTextField.isEnabled = true
        phoneNumberTextField.becomeFirstResponder()
    }
    
    @IBAction func addressBtnAction(_ sender: UIButton) {
        addressTextView.isEditable = true
        addressTextView.becomeFirstResponder()
    }
    
    @IBAction func logoutBtnAction (sender: UIButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension UserInfoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isEnabled = false
    }
}

extension UserInfoViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
        textView.isEditable = false
        textView.isSelectable = false
    }
}

