//
//  ServiceTableViewCell.swift
//  FindWorker
//
//  Created by hoangtp on 8/21/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameServiceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(_ service: ServiceModel) {
        nameServiceLabel.text = service.name
        if let iconName = service.icon {
            iconImage.image = UIImage(named: "\(iconName).png")
        }
    }
}
