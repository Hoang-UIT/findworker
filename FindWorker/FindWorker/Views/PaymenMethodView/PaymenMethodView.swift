//
//  PaymenMethodView.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class PaymenMethodView: BaseView {
    
    @IBOutlet weak var contentView: UIView!
    
    override func showViewInWindow() {
        super.showViewInWindow()
        contentView.frame.origin.y += 100
        self.alpha = 0.0
        UIView.animate(withDuration: 0.5, animations: {
            self.contentView.frame.origin.y -= 100
            self.alpha = 1.0
        })
    }
    
    @IBAction func doneBtnAction(sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.contentView.frame.origin.y += 100
            self.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
