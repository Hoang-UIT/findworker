//
//  BaseView.swift
//  FindWorker
//
//  Created by hoangtp on 8/31/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        let view = Self.loadFromXib(withOwner: self)
        view.frame = self.bounds
        self.addSubview(view)
        config()
    }
    
    func config() {
        
    }
    
    func showInView(_ subView: UIView) {
        subView.addSubview(self)
        self.frame = subView.frame
    }
    
    func showViewInWindow() {
        guard let window =  UIApplication.shared.windows.first else {
            return
        }
        self.frame = window.frame
        window.addSubview(self)
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
    }
}
