//
//  MainMenuView.swift
//  FindWorker
//
//  Created by hoangtp on 8/24/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

protocol MainMenuViewDelegate: class {
    func mainMenuView(_ view: MainMenuView, logout: Bool)
    func mainMenuView(_ view: MainMenuView, type: MainMenuView.MenuType)
}

class MainMenuView: BaseView {
    enum MenuType {
        case UserInfo
        case OrderInfo
        case Setting
    }
    
    weak var delegate: MainMenuViewDelegate?
    
    @IBOutlet weak var buttonBackground: UIButton!
    @IBOutlet weak var contentView: UIView!

    override func showViewInWindow() {
        super.showViewInWindow()
        
        contentView.frame.origin.x = -100
        self.alpha = 0.0
        UIView.animate(withDuration: 1.0, animations: {
            self.contentView.frame.origin.x = 100
            self.alpha = 1.0
        }) { _ in
            
        }
    }
    
    @IBAction func infoUserBtnAction(_ sender: UIButton) {
        if delegate != nil {
            delegate?.mainMenuView(self, type: .UserInfo)
        }
        
    }
    
    @IBAction func infoOrderBtnAction(_ sender: UIButton) {
        if delegate != nil {
            delegate?.mainMenuView(self, type: .OrderInfo)
        }
    }

    @IBAction func logoutBtnAction(_ sender: UIButton) {
        if delegate != nil {
            delegate?.mainMenuView(self, logout: true)
        }
    }
}

private extension MainMenuView {
    @IBAction func dismissMainMenuBtnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {
            self.contentView.frame.origin.x = -100
            self.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
