//
//  WorkerDetailViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/26/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class WorkerDetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "WorkerInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "WorkerInfoTableViewCell")
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Thông Tin Của Thợ"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectWorkerBtnAction(_ sender: UIButton) {
        let viewController = ConfirmOrderViewController.loadFromNib()
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension WorkerDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Nhận Xét Của Khách Hàng"
        }
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "WorkerInfoTableViewCell", for: indexPath) as? WorkerInfoTableViewCell {
                return cell
            }
            break
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell {
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}
