//
//  DateTimePickerView.swift
//  FindWorker
//
//  Created by hoangtp on 9/9/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

protocol DateTimePickerViewDelegate: class  {
    func dateTimePickerView(_ view: DateTimePickerView, dateSelected: Date)
}

class DateTimePickerView: BaseView {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneBtnAction: UIButton!
    
    weak var delegate: DateTimePickerViewDelegate?
    
    override func config() {
        datePicker.backgroundColor  = .white
        datePicker.date = Date()
        datePicker.minimumDate = Date()
    }
    
    @IBAction func todayBtnAction(_ sender: UIButton) {
        datePicker.date = Date()
    }
    
    @IBAction func doneBtnAction(_ sender: UIButton) {
        if delegate != nil {
            delegate?.dateTimePickerView(self, dateSelected: datePicker.date)
        }
    }
    
    @IBAction func cancelBtnAction(_ sender: UIButton) {
        self.removeFromSuperview()
    }
}
