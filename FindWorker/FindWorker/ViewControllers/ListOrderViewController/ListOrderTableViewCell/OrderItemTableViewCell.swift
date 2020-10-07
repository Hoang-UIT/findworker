//
//  OrderItemTableViewCell.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class OrderItemTableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateData(_ order: OrderModel) {
        statusLabel.text = "(\(order.status.localized))"
    }
}
