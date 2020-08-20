//
//  LaunchScreenViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/20/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class LaunchScreenViewController: BaseViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let loginViewController = LoginViewController.instantiateViewController(Constants.StoryboardID.LoginScreen)
            self.present(loginViewController, animated: true, completion: nil)
        }
    }
}
