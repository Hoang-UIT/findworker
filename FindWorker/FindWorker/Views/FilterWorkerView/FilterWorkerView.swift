//
//  FilterWorkerView.swift
//  FindWorker
//
//  Created by hoangtp on 8/26/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

protocol FilterWorkerViewDelegate: class {
    func dismissilterWorkerView( _ view: FilterWorkerView, dismissView: Bool)
}

class FilterWorkerView: BaseView {
    @IBOutlet weak var experienceSegment: UISegmentedControl!
    @IBOutlet weak var ratingSegment: UISegmentedControl!
    
    @IBOutlet weak var contentView: UIView!
    
    weak var delegate: FilterWorkerViewDelegate?

    override func config() {
    experienceSegment.setSegmentStyle()
        experienceSegment.selectedSegmentIndex = experienceSegment.numberOfSegments - 1
        
        ratingSegment.setSegmentStyle()
        ratingSegment.selectedSegmentIndex = ratingSegment.numberOfSegments - 1
    }
    
    override func showInView(_ subView: UIView) {
        super.showInView(subView)
        contentView.frame.origin.y -= 100
        self.alpha = 0.0
        UIView.animate(withDuration: Constants.TimeAnimate, animations: {
            self.contentView.frame.origin.y += 100
            self.alpha = 1.0
        })
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        if delegate != nil {
            delegate?.dismissilterWorkerView(self, dismissView: true)
        }
    }
    
    override func removeFromSuperview() {
        UIView.animate(withDuration: Constants.TimeAnimate, animations: {
            self.contentView.frame.origin.y -= 100
            self.alpha = 0.0
        }) {_ in
            self.contentView.frame.origin.y += 100
            super.removeFromSuperview()
        }
    }
}
