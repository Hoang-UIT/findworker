//
//  FilterOrderView.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

protocol FilterOrderViewDelegate: class {
    func filterOrderView(_ view: FilterOrderView, _ statusSelected: StatusOrder)
}
class FilterOrderView: BaseView {

    @IBOutlet weak var contentView: UIStackView!

    @IBOutlet weak var button_1: UIButton!
    @IBOutlet weak var button_2: UIButton!
    @IBOutlet weak var button_3: UIButton!
    @IBOutlet weak var button_4: UIButton!
    @IBOutlet weak var button_5: UIButton!
    @IBOutlet weak var button_6: UIButton!
    @IBOutlet weak var button_7: UIButton!
    
    weak var delegate: FilterOrderViewDelegate?
    
    var statusOrder: StatusOrder = .status_7 {
        didSet {
            updateUI()
        }
    }
    
    var listStatusBtn = [UIButton]()
    
    override func config() {
        listStatusBtn.append(button_1)
        listStatusBtn.append(button_2)
        listStatusBtn.append(button_3)
        listStatusBtn.append(button_4)
        listStatusBtn.append(button_5)
        listStatusBtn.append(button_6)
        listStatusBtn.append(button_7)
    }
    
    override func showViewInWindow() {
        super.showViewInWindow()
        contentView.frame.origin.y += 100
        self.alpha = 0.0
        UIView.animate(withDuration: Constants.TimeAnimate, animations: {
            self.contentView.frame.origin.y -= 100
            self.alpha = 1.0

        }) { _ in
            
        }
    }
    
    func updateUI() {
        for statusBtn in listStatusBtn {
            if let text = statusBtn.titleLabel?.text, text.elementsEqual(statusOrder.localized) {
                statusBtn.backgroundColor = Constants.ColorApp.mainColor
                statusBtn.isSelected = true
            }
        }
    }
    
    @IBAction func statusBtnAction(sender: UIButton) {
        for statusBtn in listStatusBtn {
            statusBtn.isSelected = false
            statusBtn.backgroundColor = .white
        }
        sender.isSelected = true
        sender.backgroundColor = Constants.ColorApp.mainColor
        if let text = sender.titleLabel?.text, let status = StatusOrder(rawValue: text) {
            if delegate != nil {
                delegate?.filterOrderView(self, status)
            }
        }
    }
    
    @IBAction func doneBtnAction(sender: UIButton) {
        UIView.animate(withDuration: Constants.TimeAnimate, animations: {
            self.contentView.frame.origin.y += 100
            self.alpha = 0.0

        }) { _ in
            self.removeFromSuperview()
        }
    }
}
