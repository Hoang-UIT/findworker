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
        _ = setRootViewController(launcherScreenViewController)
        return true
    }
    
    func setRootViewController(_ viewController: UIViewController?) -> Bool {
        guard let viewController = viewController else {
            return false
        }
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        return true
    }
}

