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
    
    @IBOutlet weak var contentView: UIView!

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
    
    @IBAction func settingBtnAction(_ sender: UIButton) {
        if delegate != nil {
            delegate?.mainMenuView(self, type: .Setting)
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
        self.removeFromSuperview()
    }
}
