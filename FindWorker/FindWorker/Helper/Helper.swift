//
//  Helper.swift
//  FindWorker
//
//  Created by hoangtp on 9/14/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import MapKit

class Helper: NSObject {
    static var app: Helper = {
        return Helper()
    }()
    
    func getAddressCurrentLocation(_ completionHandler:((_ address: String)->())?) {
        let locationManager = CLLocationManager()
        if let userLocation = locationManager.location?.coordinate {
            getAddressFromLatLon(pdblLatitude: "\(userLocation.latitude)", withLongitude: "\(userLocation.longitude)") { (address) in
                completionHandler?(address)
            }
        }
    }
    
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String, _ completionHandler:((_ address: String)->())?){
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        //21.228124
        let lon: Double = Double("\(pdblLongitude)")!
        //72.833770
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon

        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]

                if pm.count > 0 {
                    let pm = placemarks![0]
                    var addressString : String = ""
                    if pm.subLocality != nil {
                        addressString = addressString + (pm.subLocality ?? "") + ", "
                    }
                    if pm.thoroughfare != nil {
                        addressString = addressString + (pm.thoroughfare ?? "") + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + (pm.locality ?? "") + ", "
                    }
                    if pm.country != nil {
                        addressString = addressString + (pm.country ?? "")
                    }
                    print(addressString)
                    completionHandler?(addressString)
              }
        })
    }
}
