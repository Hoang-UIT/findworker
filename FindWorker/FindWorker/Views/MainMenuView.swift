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

class MainMenuView: UIView {
    enum MenuType {
        case UserInfo
        case OrderInfo
        case Setting
    }
    
    let nibName = "MainMenuView"
    weak var delegate: MainMenuViewDelegate?
    
    @IBOutlet weak var contentView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return nil
        }
        return view
    }
    
    func showViewInWindow() {
        guard let window =  UIApplication.shared.windows.first else {
            return
        }
        self.frame = window.frame
        window.addSubview(self)
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
