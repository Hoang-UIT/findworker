//
//  HomeViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/21/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    private var rightBarButton: UIBarButtonItem?
    
    private var numberService = 0
    
    private var services = [
        ServiceModel("Thợ Khoá", "tho_sua_khoa_img"),
        ServiceModel("Thợ Điện Lạnh", "tho_dien_lanh_img"),
        ServiceModel("Thợ Sửa Điện", "tho_sua_dien_img"),
        ServiceModel("Cứu Hộ Xe", "tho_sua_xe_may_img"),
        ServiceModel("Thợ Xây Dựng", "tho_xay_dung_img"),
        ServiceModel("Lao Động Phổ Thông", "lao_dong_pho_thong_img"),
        ServiceModel("Người Giúp Việc", "giup_viec_nha_img"),
        ServiceModel("Thợ Thông Cống", "tho_thong_cong_img"),
        ServiceModel("Thợ Máy Tính", "tho_sua_may_tinh_img"),
        ServiceModel("Thợ Sửa Nước", "tho_sua_nuoc_img"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.init(hex: "#34C759ff") ?? UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu_img.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        rightBarButton = UIBarButtonItem(image: UIImage(named: "order_img.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButton
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
    }
    
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath) as? ServiceTableViewCell {
            let service = services[indexPath.row]
            cell.loadData(service)
            return cell
        }
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        numberService += 1
        rightBarButton?.setBadge(text: "\(numberService)")
    }
}
