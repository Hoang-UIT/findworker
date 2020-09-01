//
//  ServiceDetailViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/25/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit
import WebKit

protocol ServiceDetailViewControllerDelegate: class {
    func serviceDetailViewController(_ viewController: ServiceDetailViewController, serviceDetail: ServiceDetailModel?)
}
class ServiceDetailViewController: BaseViewController {

    @IBOutlet weak var contentWKWebView: WKWebView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var bottomView: UIStackView!
    
    weak var delegate: ServiceDetailViewControllerDelegate?
    
    var isHiddenBottomView = false
    var service: ServiceModel?
    var serviceDetail: ServiceDetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = service?.name ?? "Vệ Sinh Máy Lạnh"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bottomView.isHidden = isHiddenBottomView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addButton.isSelected = serviceDetail?.isSelected ?? false
        
        if let filepath = Bundle.main.path(forResource: "content", ofType: "html") {
            do {
                let contents = try String(contentsOfFile: filepath)
                contentWKWebView.loadHTMLString(contents, baseURL: nil)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
    }
    
    
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        serviceDetail?.isSelected = sender.isSelected
        if delegate != nil {
            delegate?.serviceDetailViewController(self, serviceDetail: serviceDetail)
        }
    }
}
