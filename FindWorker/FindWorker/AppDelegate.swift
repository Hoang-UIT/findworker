//
//  AppDelegate.swift
//  FindWorker
//
//  Created by hoangtp on 8/20/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        
        let launcherScreenViewController = LaunchScreenViewController.instantiateViewController(Constants.StoryboardID.launcherScreen)
        AppDelegate.setRootViewController(launcherScreenViewController)
        return true
    }
    
    class func setRootViewController(_ viewController: UIViewController?) {
        guard let viewController = viewController else {
            return
        }
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: false, completion: nil)
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    class func dismissToRootViewController() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: false, completion: nil)
    }
}

