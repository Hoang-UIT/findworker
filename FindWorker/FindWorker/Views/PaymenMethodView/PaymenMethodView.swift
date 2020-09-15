//
//  PaymenMethodView.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

protocol PaymenMethodViewDelegate: class {
    func paymenMethodView( _ view: PaymenMethodView, _ typeSelected: PaymentType)
}

class PaymenMethodView: BaseView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var cashButton: UIButton!
    @IBOutlet weak var creditCardButton: UIButton!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var walletButton: UIButton!
    
    weak var delegate: PaymenMethodViewDelegate?
    var paymentType = PaymentType.Cashing
    var paymentButton = [UIButton]()
    
    override func config() {
        paymentButton.append(cashButton)
        paymentButton.append(creditCardButton)
        paymentButton.append(transferButton)
        paymentButton.append(walletButton)
        updateUI()
    }
    
    func updateUI() {
        for sender in paymentButton {
            sender.setTitleColor(Constants.ColorApp.mainColor, for: .normal)
            sender.backgroundColor = .white
        }
        switch paymentType {
        case .Cashing:
            cashButton.setTitleColor(.white, for: .normal)
            cashButton.backgroundColor = Constants.ColorApp.mainColor
        case .CreditCard:
            creditCardButton.setTitleColor(.white, for: .normal)
            creditCardButton.backgroundColor = Constants.ColorApp.mainColor
        case .Transfer:
            transferButton.setTitleColor(.white, for: .normal)
            transferButton.backgroundColor = Constants.ColorApp.mainColor
        case .DigitalWallet:
            walletButton.setTitleColor(.white, for: .normal)
            walletButton.backgroundColor = Constants.ColorApp.mainColor
        }
    }
    
    override func showViewInWindow() {
        super.showViewInWindow()
        contentView.frame.origin.y += 100
        self.alpha = 0.0
        UIView.animate(withDuration: Constants.TimeAnimate, animations: {
            self.contentView.frame.origin.y -= 100
            self.alpha = 1.0
        })
    }
    
    @IBAction func doneBtnAction(sender: UIButton) {
        if let text = sender.titleLabel?.text,
            let type = PaymentType(rawValue: text) {
            paymentType = type
            updateUI()
            if delegate != nil {
                delegate?.paymenMethodView(self, type)
            }
        }
        
        UIView.animate(withDuration: Constants.TimeAnimate, animations: {
            self.contentView.frame.origin.y += 100
            self.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
