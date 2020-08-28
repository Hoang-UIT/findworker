//
//  ListOrderViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class ListOrderViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeTapGestureEndEditing()
        titleViewController = "Chờ Xử Lý"
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "order_type_2_img.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(showTypeOrder))
        navigationItem.rightBarButtonItem = rightBarButton
        tableView.register(UINib(nibName: "OrderItemTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderItemTableViewCell")
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func showTypeOrder() {
        let view = FilterOrderView()
        view.showViewInWindow()
    }

}

extension ListOrderViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "OrderItemTableViewCell") as? OrderItemTableViewCell {
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let viewController = ConfirmOrderViewController.loadFromNib()
        viewController.isHiddenBottomContentView = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}
