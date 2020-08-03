//
//  CustomMapView.swift
//  Together
//
//  Created by Anastasia Reyngardt on 31.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit
import MapKit


class CustomMapView: MKMapView {
    
    private var presenter: MapViewActions?
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        self.userLocation.title = "Вы здесь"
        self.delegate = self
    }
}


//MARK: - MKMapViewDelegate
// для изменения вида отображение обьектов на карте, с более подробной информации
extension CustomMapView: MKMapViewDelegate {
    
    //настройка вью для аннотации
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is EventMapPin
            else { return nil }
        
        let identifier = "event"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
            view.canShowCallout = true
            view.rightCalloutAccessoryView = UIButton(type: .custom)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        guard let pin = view.annotation as? EventMapPin
            else { return }
        
        presenter?.eventPinDidTapped(pin: pin)
    }
}


//MARK: - MKMapViewDelegate
extension CustomMapView: PresenterHaving {
    func setPresenter(_ presenter: ViewAstions) {
        if let presenter = presenter as? MapViewActions {
            self.presenter = presenter
        }
    }
}
