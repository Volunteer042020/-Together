//
//  UIMapView + zoomMap().swift
//  Together
//
//  Created by Евгений Шварцкопф on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import MapKit

//MARK: Расшерение Карты для увелечение и уменьшение масштаба 

extension MKMapView {
    
    // здесь просто ставим отрицательное или положительное число для нужного масштаба
    
    func zoomMap(byFactor delta: Double) {
        if delta > 0 {
            let span = MKCoordinateSpan(latitudeDelta: self.region.span.latitudeDelta/2, longitudeDelta: self.region.span.longitudeDelta/2)
            let region = MKCoordinateRegion(center: self.region.center, span: span)
            
            self.setRegion(region, animated: true)
        } else {
            let span = MKCoordinateSpan(latitudeDelta: self.region.span.latitudeDelta*2, longitudeDelta: self.region.span.longitudeDelta*2)
            let region = MKCoordinateRegion(center: self.region.center, span: span)
            
            self.setRegion(region, animated: true)
        }
    }
}
