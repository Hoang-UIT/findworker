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
    
    static let TimeAnimate = 0.3
    
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
    
    struct DateFormatter {
        static let ddMMyyyy = "dd-MM-yyyy"
    }
}


enum StatusOrder: String {
    case status_1 = "Chờ Xử Lý"
    case status_2 = "Thợ Đã Xác Nhận"
    case status_3 = "Thợ Khảo Sát Công Việc"
    case status_4 = "Thợ Đang Thực Hiện Công Việc"
    case status_5 = "Công Việc Đã Hoàn Thành"
    case status_6 = "Đã Thanh Toán"
    case status_7 = "Tất Cả"
    
    var localized: String {
      return NSLocalizedString(self.rawValue, comment: "")
    }
}

enum  PaymentType: String {
    case Cashing = "Tiền Mặt"
    case CreditCard = "Thẻ Tín Dụng"
    case Transfer = "Chuyển Khoản"
    case DigitalWallet = "Ví Điện Tử"
    
    var localized: String {
      return NSLocalizedString(self.rawValue, comment: "")
    }
}
