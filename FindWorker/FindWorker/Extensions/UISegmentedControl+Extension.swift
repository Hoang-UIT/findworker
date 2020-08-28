//
//  UISegmentedControl+Extension.swift
//  FindWorker
//
//  Created by hoangtp on 8/26/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import  UIKit

extension UISegmentedControl {
    func setSegmentStyle() {
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
        tintColor = Constants.ColorApp.mainColor
        setBackgroundImage(imageWithColor(color: .white), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: tintColor), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.cornerRadius = 5.0
        layer.borderColor = tintColor.cgColor
        
        if let fontStyle = UIFont(name: "AvenirNext-Bold", size: 16) {
            let segAttributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: fontStyle
            ]
            setTitleTextAttributes(segAttributes, for: UIControl.State.selected)
        }
        if let fontStyle = UIFont(name: "AvenirNext-Regular", size: 14) {
            let segAttributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.font: fontStyle
            ]
            setTitleTextAttributes(segAttributes, for: UIControl.State.normal)
        }
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}

