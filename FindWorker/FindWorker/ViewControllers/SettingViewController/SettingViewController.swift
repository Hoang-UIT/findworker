//
//  SettingViewController.swift
//  FindWorker
//
//  Created by hoangtp on 9/4/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        titleViewController = "Cài Đặt"
        removeTapGestureEndEditing()
    }
    @IBAction func permissionBtnAction(_ sender: Any) {
        let viewController = PermissionViewController.loadFromNib()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
