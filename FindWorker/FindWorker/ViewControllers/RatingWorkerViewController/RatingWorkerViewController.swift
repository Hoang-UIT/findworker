//
//  RatingWorkerViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/28/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit

class RatingWorkerViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeTapGestureEndEditing()
        
        titleViewController = "Đánh Giá Chất Lượng Nhân Viên"
    }
    @IBAction func skipBtnAction(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func doneBtnAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Thông Báo", message: "Cảm ơn về đánh giá của bạn. Đánh giá của bạn sẽ giúp chúng tôi được phục vụ tốt hơn cho lần sau.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Xong", style: .default, handler: { (action) in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
