//
//  MapViewController.swift
//  FindWorker
//
//  Created by hoangtp on 8/27/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit
import MapKit

protocol MapViewControllerDelegate: class {
    func mapViewController( _ viewController: MapViewController, _ address: String)
}

class MapViewController: BaseViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()

    var searchView: SearchLocationView?
    var locationSelected: MKMapItem?
    
    lazy var rightBarButton = UIBarButtonItem(image: UIImage(named: "search_img.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(showSearchView))
    
    weak var delegate: MapViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleViewController = "Địa Chỉ"
        removeTapGestureEndEditing()
        navigationItem.rightBarButtonItem = rightBarButton
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
        navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(image: UIImage(named: "back_img.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backBarButtonItem))
        navigationItem.leftBarButtonItem = newBackButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if locationSelected == nil {
            if let userLocation = locationManager.location?.coordinate {
                let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
                mapView.setRegion(viewRegion, animated: true)
                let annotation = MKPointAnnotation()
                annotation.coordinate = userLocation
                mapView.addAnnotation(annotation)
                Helper.app.getAddressFromLatLon(pdblLatitude: "\(userLocation.latitude)", withLongitude: "\(userLocation.longitude)") { (address) in
                    print(address)
                }
            }
        }
    }
    
    @objc func showSearchView() {
        if searchView == nil {
            searchView = SearchLocationView()
            searchView?.delegate = self
            searchView?.mapView = mapView
        }
        
        searchView?.showInView(self.view)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hủy", style: .done, target: self, action: #selector(dissmisSearchView))
    }
    
    @objc func dissmisSearchView() {
        searchView?.removeFromSuperview()
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    @objc func backBarButtonItem(sender: UIBarButtonItem) {
        if let _ = view.subviews.last as? SearchLocationView {
            dissmisSearchView()
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func backBtnAction(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneBtnAction(sender: UIButton) {
        if delegate != nil,
            let placeMark = locationSelected?.placemark {
            let address = "\(placeMark.name ?? ""), \(placeMark.thoroughfare ?? ""), \(placeMark.locality ?? ""), \(placeMark.subLocality ?? ""), \(placeMark.administrativeArea ?? ""), \(placeMark.country ?? "")"
            delegate?.mapViewController(self, address)
        }
        navigationController?.popViewController(animated: true)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("location: \(location)")
//            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//            let region = MKCoordinateRegion(center: location.coordinate, span: span)
//            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
extension MapViewController: SearchLocationViewDelegate {
    func searchLocationView(_ view: SearchLocationView, _ location: MKMapItem) {
        locationSelected = location
        dropPinZoomIn(placemark: location.placemark)
        view.removeFromSuperview()
    }
    
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}
