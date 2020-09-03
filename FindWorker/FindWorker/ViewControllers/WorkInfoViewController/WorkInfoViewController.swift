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
    override func viewDidLoad() {
        super.viewDidLoad()
        removeTapGestureEndEditing()
        tableView.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressTableViewCell")
        tableView.dataSource = self
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
        
        let min = Date().addingTimeInterval(-60 * 60 * 24 * 0)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 60)
        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)
        picker.includesMonth = true
        picker.isDatePickerOnly = true
        picker.dateFormat = "dd/MM/YYYY"
        picker.highlightColor = Constants.ColorApp.mainColor
        picker.doneBackgroundColor = Constants.ColorApp.mainColor
        picker.show()
    }
    
    @IBAction func locationBtnAction(_ sender: UIButton) {
        let viewController = MapViewController.loadFromNib()
        present(viewController, animated: true, completion: nil)
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath)
        return cell
    }
}
