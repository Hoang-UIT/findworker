//
//  Constants.swift
//  FindWorker
//
//  Created by hoangtp on 8/20/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit
import Foundation

struct Constants {
    
    struct StoryboardID {
        static let launcherScreen = "LaunchScreenViewController"
        static let LoginScreen = "LoginViewController"
        static let registerScreen = "RegisterViewController"
        static let forgetPasswordScreen = "ForgetPasswordViewController"
        static let updatePasswordScreen = "UpdatePasswordViewController"
        static let homeScreen = "HomeViewController"
        static let serviceDetailScreen = "ServiceDetailViewController"
        static let WorkInfoScreen = "WorkInfoViewController"
        static let LocationWorkScreen = "LocationWorkViewController"
        static let MapScreen = "MapViewController"
        static let ListWorkerScreen = "ListWorkerViewController"
        static let WorkerDetailScreen = "WorkerDetailViewController"
        static let ConfirmOrderScreen = "ConfirmOrderViewController"
    }
    
    struct ColorApp {
        static let mainColor = UIColor.init(hex: "#34C759ff") ?? UIColor.black
    }
}
