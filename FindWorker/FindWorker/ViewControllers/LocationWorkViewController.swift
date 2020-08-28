//
//  LocationWorkViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/27/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class LocationWorkViewController: BaseViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        removeTapGestureEndEditing()
        
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Nhập Địa Chỉ"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    @IBAction func mapBtnAction(_ sender: UIButton) {
        if let viewController = MapViewController.instantiateViewController(Constants.StoryboardID.MapScreen) as? MapViewController {
            present(viewController, animated: true, completion: nil)
        }
    }
    
}

extension LocationWorkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath)
        return cell
    }
}
