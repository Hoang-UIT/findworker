//
//  ServiceSectionView.swift
//  FindWorker
//
//  Created by hoangtp on 8/24/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

protocol ServiceSectionViewDelegate: class {
    func serviceSectionView(_ view: ServiceSectionView, service: ServiceModel)
}
class ServiceSectionView: BaseView {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameServiceLabel: UILabel!
        
    weak var delegate: ServiceSectionViewDelegate?
    var service: ServiceModel?
    
    func loadData(_ service: ServiceModel) {
        self.service = service
        nameServiceLabel.text = service.name
        if let iconName = service.icon {
            iconImage.image = UIImage(named: "\(iconName).png")
        }
    }
    @IBAction func tapSectionBtnAction(_ sender: UIButton) {
        if delegate != nil {
            if let service = service {
                self.service?.isSelected = !service.isSelected
                delegate?.serviceSectionView(self, service: service)
            }
        }
    }
}
