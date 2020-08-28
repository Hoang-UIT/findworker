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

class FilterWorkerView: UIView {

    @IBOutlet weak var moneySegment: UISegmentedControl!
    @IBOutlet weak var experienceSegment: UISegmentedControl!
    @IBOutlet weak var ratingSegment: UISegmentedControl!
    
    let nibName = "FilterWorkerView"
    
    weak var delegate: FilterWorkerViewDelegate?
    
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
        
        moneySegment.setSegmentStyle()
        moneySegment.selectedSegmentIndex = moneySegment.numberOfSegments - 1
        
        experienceSegment.setSegmentStyle()
        experienceSegment.selectedSegmentIndex = experienceSegment.numberOfSegments - 1
        
        ratingSegment.setSegmentStyle()
        ratingSegment.selectedSegmentIndex = ratingSegment.numberOfSegments - 1
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
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        if delegate != nil {
            delegate?.dismissilterWorkerView(self, dismissView: true)
        }
        removeFromSuperview()
    }
}
