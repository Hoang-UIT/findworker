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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startDateBtn: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleViewController = "Thông Tin Công Việc"
        removeTapGestureEndEditing()
        tableView.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressTableViewCell")
        tableView.dataSource = self
        let dateStr = Date().toString(Constants.DateFormatter.ddMMyyyy)
        startDateBtn.setTitle(dateStr, for: .normal)
        
        Helper.app.getAddressCurrentLocation { [weak self] (address) in
            self?.setAddress(address)
        }
    }

    func showDateTimePicker() {
        
//        let min = Date().addingTimeInterval(-60 * 60 * 24 * 0)
//        let max = Date().addingTimeInterval(60 * 60 * 24 * 60)
//        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)
//        picker.includesMonth = true
//        picker.isDatePickerOnly = true
//        picker.dateFormat = "dd/MM/YYYY"
//        picker.highlightColor = Constants.ColorApp.mainColor
//        picker.doneBackgroundColor = Constants.ColorApp.mainColor
//        picker.show()

        if let dateStr = startDateBtn.titleLabel?.text {
            let date = Date.stringToDate(dateStr, Constants.DateFormatter.ddMMyyyy)
            let datePicker = DateTimePickerView()
            datePicker.datePicker.date = date ??  Date()
            datePicker.delegate = self
            datePicker.showInView(self.view)
        }
    }
    
    func setAddress(_ address: String) {
        addressLabel.text = address
    }
    
    @IBAction func locationBtnAction(_ sender: UIButton) {
        let viewController = MapViewController.loadFromNib()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func startDateBtnAction(_ sender: UIButton) {
        showDateTimePicker()
    }
    @IBAction func nextBtnAction(_ sender: UIButton) {
        let viewController = ListWorkerViewController.loadFromNib()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension WorkInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath)
        return cell
    }
}

extension WorkInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension WorkInfoViewController: DateTimePickerViewDelegate {
    func dateTimePickerView(_ view: DateTimePickerView, dateSelected: Date) {
        view.removeFromSuperview()
        let dateStr = dateSelected.toString(Constants.DateFormatter.ddMMyyyy)
        startDateBtn.setTitle(dateStr, for: .normal)
    }
}

extension WorkInfoViewController: MapViewControllerDelegate {
    func mapViewController(_ viewController: MapViewController, _ address: String) {
        setAddress(address)
    }
}
