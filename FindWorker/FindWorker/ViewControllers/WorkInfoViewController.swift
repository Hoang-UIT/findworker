//
//  WorkInfoViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/27/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit
import DateTimePicker

class WorkInfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        removeTapGestureEndEditing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Thông Tin Công Việc"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    func showDateTimePicker() {
        let min = Date().addingTimeInterval(-60 * 60 * 24 * 4)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 4)
        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)
        picker.isDatePickerOnly = true
        picker.dateFormat = "dd/MM/YYYY"
        picker.highlightColor = Constants.ColorApp.mainColor ?? UIColor.darkGray
        picker.doneBackgroundColor = Constants.ColorApp.mainColor ?? UIColor.darkGray
        picker.show()
    }
    
    @IBAction func locationBtnAction(_ sender: UIButton) {
        if let viewController = LocationWorkViewController.instantiateViewController(Constants.StoryboardID.LocationWorkScreen) as? LocationWorkViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func startDateBtnAction(_ sender: UIButton) {
        showDateTimePicker()
    }
    
    @IBAction func endDateBtnAction(_ sender: UIButton) {
        showDateTimePicker()
    }
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
        if let viewController = ListWorkerViewController.instantiateViewController(Constants.StoryboardID.ListWorkerScreen) as? ListWorkerViewController {
                   navigationController?.pushViewController(viewController, animated: true)       
        }
    }
}
