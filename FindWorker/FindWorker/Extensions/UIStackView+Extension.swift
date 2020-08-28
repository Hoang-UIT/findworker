//
//  UIStackView+Extension.swift
//  FindWorker
//
//  Created by hoangtp on 8/27/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

extension UIStackView {
    @IBInspectable
    public var setBackgroundColor: UIColor
    {
        set (color) {
            addBackground(color: color)
        }
        get {
            return self.arrangedSubviews.first?.backgroundColor ?? UIColor.clear
        }
    }
    
    private func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
