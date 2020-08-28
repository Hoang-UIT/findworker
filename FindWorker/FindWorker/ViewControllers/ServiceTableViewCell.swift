//
//  ServiceTableViewCell.swift
//  FindWorker
//
//  Created by hoangtp on 8/21/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

protocol ServiceTableViewCellDelegate: class {
    func serviceTableViewCell( _ cell: ServiceTableViewCell, serviceDetail: ServiceDetailModel)
}

class ServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameServiceLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
    
    weak var delegate: ServiceTableViewCellDelegate?
    
    var serviceDetail: ServiceDetailModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(_ service: ServiceDetailModel) {
        self.serviceDetail = service
        nameServiceLabel.text = service.name
        checkboxButton.isSelected = service.isSelected
    }
    @IBAction func selectBtnAction(_ sender: UIButton) {
        if let serviceDetail = serviceDetail {
            serviceDetail.isSelected = !serviceDetail.isSelected
            self.serviceDetail = serviceDetail
            sender.isSelected = serviceDetail.isSelected
            if delegate != nil {
                delegate?.serviceTableViewCell(self, serviceDetail: serviceDetail)
            }
        }
    }
}
