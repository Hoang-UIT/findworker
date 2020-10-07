//
//  ConfirmOrderViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class ConfirmOrderViewController: BaseViewController {
    
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomContentView: UIStackView!
    @IBOutlet weak var highConstraintTableView: NSLayoutConstraint!
    var order: OrderModel?
    
    
    var paymentType = PaymentType.Cashing
    var isHiddenBottomContentView = false

    override func viewDidLoad() {
        super.viewDidLoad()
        removeTapGestureEndEditing()
        tableView.register(UINib(nibName: "WorkItemTableViewCell", bundle: nil), forCellReuseIdentifier: "WorkItemTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        titleViewController = "Đơn Hàng"
        
        bottomContentView.isHidden = isHiddenBottomContentView
    }
          
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        DispatchQueue.main.async {
            self.highConstraintTableView.constant = self.tableView.contentSize.height
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func cancelBtnAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func aceptBtnAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Thông Báo", message: "Yêu cầu đã được khởi tạo. Hệ thống sẽ gửi thông báo khi thông tin được xử lý hoàn tất.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Xong", style: .default, handler: { (action) in
            let viewController = RatingWorkerViewController.loadFromNib()
            self.navigationController?.pushViewController(viewController, animated: true)
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func payBtnAction(_ sender: UIButton) {
        let paymenMethodView = PaymenMethodView()
        paymenMethodView.delegate = self
        paymenMethodView.paymentType = paymentType
        paymenMethodView.showViewInWindow()
    }
}

extension ConfirmOrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order?.services.count ?? 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WorkItemTableViewCell") as? WorkItemTableViewCell {
            if let service = order?.services[indexPath.row] {
                cell.loadData(service)
            }
            return cell
        }
        return UITableViewCell()
    }
}

extension ConfirmOrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let viewController = ServiceDetailViewController.instantiateViewController(Constants.StoryboardID.serviceDetailScreen) as? ServiceDetailViewController {
            viewController.isHiddenBottomView = true
            
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewWillLayoutSubviews()
    }
}

extension ConfirmOrderViewController: PaymenMethodViewDelegate {
    func paymenMethodView(_ view: PaymenMethodView, _ typeSelected: PaymentType) {
        paymentType = typeSelected
        paymentLabel.text = typeSelected.localized
    }
}
