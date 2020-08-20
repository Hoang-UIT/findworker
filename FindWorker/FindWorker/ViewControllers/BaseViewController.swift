//
//  BaseViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/20/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class BaseViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    class func instantiateViewController(_ indentifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: indentifier)
        return viewController
    }
}
