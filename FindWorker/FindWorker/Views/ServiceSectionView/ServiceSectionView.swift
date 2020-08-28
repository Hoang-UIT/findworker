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
class ServiceSectionView: UIView {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameServiceLabel: UILabel!
    
    let nibName = "ServiceSectionView"
    
    weak var delegate: ServiceSectionViewDelegate?
    var service: ServiceModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return nil
        }
        return view
    }
    
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
