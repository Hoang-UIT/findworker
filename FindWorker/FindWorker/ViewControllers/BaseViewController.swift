//
//  BaseViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/20/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var titleViewController = ""
    var tapGestureEndEditing: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let className = String(describing: type(of: self))
        print("ViewController: [\(className)]")
        
        tapGestureEndEditing = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureEndEditing ?? UITapGestureRecognizer())
        if (navigationController != nil) {
            navigationController?.navigationBar.tintColor = UIColor.init(hex: "#34C759ff")
            navigationController?.navigationBar.barTintColor = UIColor.white
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.init(hex: "#34C759ff") ?? UIColor.white]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = titleViewController
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    func removeTapGestureEndEditing() {
        if let tap = tapGestureEndEditing {
            view.removeGestureRecognizer(tap)
        }
    }
    
    class func instantiateViewController(_ indentifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: indentifier)
        return viewController
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

