//
//  MapViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/27/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: BaseViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
