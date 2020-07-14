//
//  UIMapView + centerLocation().swift
//  Together
//
//  Created by Евгений Шварцкопф on 14.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import MapKit

// для начального отображения, настройка радиуса.
extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
