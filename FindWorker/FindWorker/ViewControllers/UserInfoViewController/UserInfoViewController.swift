//
//  UserInfoViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class UserInfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        titleViewController = "Thông Tin Người Dùng"
    }
    
    @IBAction func updatePasswordBtnAction (sender: UIButton) {
        if let viewController = UpdatePasswordViewController.instantiateViewController(Constants.StoryboardID.updatePasswordScreen) as? UpdatePasswordViewController {
           present(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func logoutBtnAction (sender: UIButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
