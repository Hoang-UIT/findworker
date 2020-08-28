//
//  FilterOrderView.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class FilterOrderView: UIView {

    let nibName = "FilterOrderView"
        
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
    
    @IBAction func doneBtnAction(sender: UIButton) {
        removeFromSuperview()
    }
}
