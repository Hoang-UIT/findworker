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
        ServiceModel(1,"Dịch Vụ Sửa Khoá", "tho_sua_khoa_img"),
        ServiceModel(2,"Dịch Vụ Sửa Điện Lạnh", "tho_dien_lanh_img"),
        ServiceModel(3,"Dịch Vụ Sửa Sửa Điện", "tho_sua_dien_img"),
        ServiceModel(4,"Dịch Vụ Cứu Hộ Xe", "tho_sua_xe_may_img"),
        ServiceModel(5,"Dịch Vụ Sửa Xây Dựng", "tho_xay_dung_img"),
        ServiceModel(6,"Lao Động Phổ Thông", "lao_dong_pho_thong_img"),
        ServiceModel(7,"Dịch Vụ Giúp Việc", "giup_viec_nha_img"),
        ServiceModel(8,"Dịch Vụ Sửa Thông Cống", "tho_thong_cong_img"),
        ServiceModel(9,"Dịch Vụ Sửa Máy Tính", "tho_sua_may_tinh_img"),
        ServiceModel(10,"Dịch Vụ Sửa Nước", "tho_sua_nuoc_img"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu_img.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(showMainMenu))
        rightBarButton = UIBarButtonItem(image: UIImage(named: "order_img.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButton
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.rowHeight = 80.0
        
        removeTapGestureEndEditing()
    }
    
    @objc func showMainMenu() {
        let menuView = MainMenuView()
        menuView.delegate = self
        menuView.showViewInWindow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Trang Chủ"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateBadgeOfShopCart(nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    func updateBadgeOfShopCart(_ serviceDetail: ServiceDetailModel?) {
        var serviceSelected = 0
        for service in services {
            service.listServiceDetail = service.listServiceDetail.map { (item) -> ServiceDetailModel in
                if service.id == serviceDetail?.serviceId  && item.id == serviceDetail?.id {
                    item.isSelected = serviceDetail?.isSelected ?? false
                }
                return item
            }
            let filter = service.listServiceDetail.filter{$0.isSelected}
            serviceSelected += filter.count
        }
        rightBarButton?.setBadge(text: "\(serviceSelected)")
    }
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
        if let viewController = WorkInfoViewController.instantiateViewController(Constants.StoryboardID.WorkInfoScreen) as? WorkInfoViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}


extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let service = services[section]
        return service.isSelected ? service.listServiceDetail.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath) as? ServiceTableViewCell {
            if cell.delegate == nil {
                cell.delegate = self
            }
            let service = services[indexPath.section].listServiceDetail[indexPath.row]
            cell.loadData(service)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view  = ServiceSectionView()
        if view.delegate == nil {
            view.delegate = self
        }
        let service = services[section]
        view.loadData(service)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let service = services[indexPath.section]
        
        if let serviceDetailViewController = ServiceDetailViewController.instantiateViewController(Constants.StoryboardID.serviceDetailScreen) as? ServiceDetailViewController {
            serviceDetailViewController.delegate = self
            serviceDetailViewController.service = service
            serviceDetailViewController.serviceDetail = service.listServiceDetail[indexPath.row]
            navigationController?.pushViewController(serviceDetailViewController, animated: true)
        }
    }
}

extension HomeViewController: ServiceTableViewCellDelegate {
    func serviceTableViewCell(_ cell: ServiceTableViewCell, serviceDetail: ServiceDetailModel) {
        updateBadgeOfShopCart(serviceDetail)
    }
}

extension HomeViewController: MainMenuViewDelegate {
    func mainMenuView(_ view: MainMenuView, logout: Bool) {
        view.removeFromSuperview()
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func mainMenuView(_ view: MainMenuView, type: MainMenuView.MenuType) {
        switch type {
        case .UserInfo:
            let viewController = UserInfoViewController.loadFromNib()
            navigationController?.pushViewController(viewController, animated: true)
            break
        case .OrderInfo:
            let viewController = ListOrderViewController.loadFromNib()
            navigationController?.pushViewController(viewController, animated: true)
            break
        case .Setting:
            break
        }
        
        view.removeFromSuperview()
        print(type)
    }
}

extension HomeViewController: ServiceDetailViewControllerDelegate {
    func serviceDetailViewController(_ viewController: ServiceDetailViewController, serviceDetail: ServiceDetailModel?) {
        if let serviceDetail = serviceDetail {
            updateBadgeOfShopCart(serviceDetail)
            tableView.reloadData()
        }
    }
}

extension HomeViewController: ServiceSectionViewDelegate {
    func serviceSectionView(_ view: ServiceSectionView, service: ServiceModel) {
        services = services.map { (item) -> ServiceModel in
            if item.id == service.id {
                item.isSelected = service.isSelected
            }
            return item
        }
        tableView.reloadData()
    }
}
