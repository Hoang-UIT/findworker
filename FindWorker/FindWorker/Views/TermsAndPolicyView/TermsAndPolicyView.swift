//
//  TermsAndPolicyView.swift
//  FindWorker
//
//  Created by hoangtp on 8/31/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit
@IBDesignable
class TermsAndPolicyView: BaseView {
    @IBOutlet weak var informationLabel: UITextView!
    
    override func config() {
        guard let attributedText = informationLabel.attributedText else {
            return
        }
        informationLabel.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: Constants.ColorApp.mainColor,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.underlineColor: Constants.ColorApp.mainColor]
        
        informationLabel.delegate = self
        
        let attr = NSMutableAttributedString()
        attr.append(attributedText)
        _ = attr.setAsLink(textToFind: "Điều khoản dịch vụ", linkURL: "https://www.google.com")
        _ = attr.setAsLink(textToFind: "Chính sách bảo mật", linkURL: "https://www.google.com")
        informationLabel.attributedText = attr
    }
    
    
    
    @IBAction func agreeBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}

extension TermsAndPolicyView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
