//
//  EventMapPin.swift
//  Together
//
//  Created by Anastasia Reyngardt on 27.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import MapKit

class EventMapPin: NSObject, MKAnnotation {
    
    let id: Int
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(id: Int, title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
