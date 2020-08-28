//
//  ListWorkerViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/25/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class ListWorkerViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var rightBarButton: UIBarButtonItem?
    var filterWorkerView: FilterWorkerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeTapGestureEndEditing()
        
        rightBarButton = UIBarButtonItem(image: UIImage(named: "filter_worker_img.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(showFilter))
        navigationItem.rightBarButtonItem = rightBarButton
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 180.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Danh Sách Thợ"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    @objc func showFilter() {
        title = "Bộ Lọc"
        if filterWorkerView == nil {
            filterWorkerView = FilterWorkerView()
        }
        filterWorkerView?.delegate = self
        filterWorkerView?.frame = view.frame
        view.addSubview(filterWorkerView ?? UIView())
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(reloadData))
    }
    
    @objc func reloadData() {
        title = "Danh Sách Thợ"
        navigationItem.setHidesBackButton(false, animated: true)
        navigationItem.rightBarButtonItem = rightBarButton
        filterWorkerView?.removeFromSuperview()
    }
}

extension ListWorkerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WorkerTableViewCell", for: indexPath) as? WorkerTableViewCell{
            return cell
        }
        return UITableViewCell()
    }
}

extension ListWorkerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let viewController = WorkerDetailViewController.instantiateViewController(Constants.StoryboardID.WorkerDetailScreen) as? WorkerDetailViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension ListWorkerViewController: FilterWorkerViewDelegate {
    func dismissilterWorkerView(_ view: FilterWorkerView, dismissView: Bool) {
        reloadData()
    }
}
