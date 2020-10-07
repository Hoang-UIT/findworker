//
//  WorkItemTableViewCell.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class WorkItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameServiceLabel: UILabel!
    @IBOutlet weak var priceServiceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func loadData(_ service: ServiceDetailModel) {
        nameServiceLabel.text = service.name ?? ""
    }
}
