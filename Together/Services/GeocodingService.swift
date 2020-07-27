//
//  GeocodingService.swift
//  Together
//
//  Created by Anastasia Reyngardt on 27.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation
import CoreLocation

protocol GeocodingServiceImpl {
     func getCoordinates(forAddress address: String, onCompleted: @escaping (CLLocationCoordinate2D?) -> Void)
}

final class GeocodingService: GeocodingServiceImpl {
    
    func getCoordinates(forAddress address: String, onCompleted: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard error == nil else {
                print("Geocoding error: \(error!)")
                onCompleted(nil)
                return
            }
            onCompleted(placemarks?.first?.location?.coordinate)
        }
    }
}

