//
//  SearchLocationView.swift
//  FindWorker
//
//  Created by hoangtp on 9/11/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit
import MapKit

protocol SearchLocationViewDelegate: class {
    func searchLocationView(_ view: SearchLocationView, _ location: MKMapItem)
}

class SearchLocationView: BaseView {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    
    weak var delegate: SearchLocationViewDelegate?
    
    var matchingItems:[MKMapItem] = []
    var mapView: MKMapView? = nil
    
    override func config() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func showInView(_ subView: UIView) {
        super.showInView(subView)
        searchBar.becomeFirstResponder()
    }
}

extension SearchLocationView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}


extension SearchLocationView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let mapView = mapView,
            let searchBarText = searchBar.text  else { return }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }
            self.matchingItems = response.mapItems
            self.tableView.reloadData()
        }
    }
}

extension SearchLocationView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  matchingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") {
            loadDataForCell(cell, indexPath)
            return cell
        } else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuseIdentifier")
            loadDataForCell(cell, indexPath)
            return cell
        }
    }
    
    func loadDataForCell(_ cell: UITableViewCell,_ indexPath: IndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        cell.textLabel?.text = selectedItem.name
        let address = "\(selectedItem.thoroughfare ?? ""), \(selectedItem.locality ?? ""), \(selectedItem.subLocality ?? ""), \(selectedItem.administrativeArea ?? ""), \(selectedItem.postalCode ?? ""), \(selectedItem.country ?? "")"
        cell.detailTextLabel?.text = address
    }
}

extension SearchLocationView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if delegate != nil {
            delegate?.searchLocationView(self, matchingItems[indexPath.row])
        }
    }
}
