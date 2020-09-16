//
//  ListWorkViewController.swift
//  FindWorker
//
//  Created by hoangtp on 9/4/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit
protocol ListWorkViewControllerDelegate: class {
    func listWorkViewController(_ viewController: ListWorkViewController, _ data: OrderModel)
}
class ListWorkViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    lazy var rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "pencil_img.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(enableEditingTableView))
    
    weak var delegate: ListWorkViewControllerDelegate?
    
    var order: OrderModel?
    
    var isEditingTableView: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeTapGestureEndEditing()
        titleViewController = "Dịch Vụ Đã Chọn"
        navigationItem.rightBarButtonItem = rightBarButtonItem
    
        tableView.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if delegate != nil, let order = order {
            delegate?.listWorkViewController(self, order)
        }
    }
    
    func updateData() {
//        order?.services.removeAll(where: { (service) -> Bool in
//            return !service.isSelected
//        })
        tableView.reloadData()
    }
    
    @objc func enableEditingTableView() {
        isEditingTableView = true
        tableView.reloadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Xong", style: .done, target: self, action: #selector(disableEditingTableView))
    }
    
    @objc func disableEditingTableView() {
        
        let alert = UIAlertController(title: "Chú Ý", message: "Bạn có đồng ý với những thay đổi vừa thực hiện ?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Hủy", style: .cancel, handler: nil)
        let doneAction = UIAlertAction(title: "Đồng ý", style: .default, handler: { (action) in
            self.isEditingTableView = false
            self.tableView.reloadData()
            self.navigationItem.rightBarButtonItem = self.rightBarButtonItem
            self.updateData()
        })
            alert.addAction(cancelAction)
            alert.addAction(doneAction)
            
            present(alert, animated: true, completion: nil)
    }
}

extension ListWorkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order?.services.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath) as? ServiceTableViewCell {
            if cell.delegate == nil {
                cell.delegate = self
            }
            if let service = order?.services[indexPath.row] {
                cell.loadData(service, true,.ListWorkViewController, isEditingTableView)
            }
            return cell
        }
        return UITableViewCell()
    }
}

extension ListWorkViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let service = order?.services[indexPath.section]
        let serviceDetailViewController = ServiceDetailViewController.loadFromNib()
        serviceDetailViewController.delegate = self
        serviceDetailViewController.serviceDetail = service
        navigationController?.pushViewController(serviceDetailViewController, animated: true)
    }
}

extension ListWorkViewController: ServiceTableViewCellDelegate {
    func serviceTableViewCell(_ cell: ServiceTableViewCell, serviceDetail: ServiceDetailModel, isSelected: Bool) {
        if isSelected {
            order?.addServiceDetail(model: serviceDetail)
        } else {
            order?.removeServiceDetail(model: serviceDetail)
        }
    }
}


extension ListWorkViewController: ServiceDetailViewControllerDelegate {
    func serviceDetailViewController(_ viewController: ServiceDetailViewController, serviceDetail: ServiceDetailModel, isSelected: Bool) {
        if isSelected {
            order?.addServiceDetail(model: serviceDetail)
        } else {
            order?.removeServiceDetail(model: serviceDetail)
        }
    }
}
