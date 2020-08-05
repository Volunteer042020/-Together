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
    
    //MARK: - Private properties
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
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //TODO: - оформить красиво
        if let compassView = self.subviews.filter({ $0.isKind(of: NSClassFromString("MKCompassView")!) }).first {
            compassView.frame = CGRect(x: self.frame.width - 50, y: 15, width: 40, height: 40)
        }
    }
    
    
    //MARK: - Private metods
    private func setupUI() {
        self.userLocation.title = "Вы здесь"
        self.delegate = self
        
        registerAnnotationViewClasses()
    }
    
    private func registerAnnotationViewClasses() {
        self.register(EventAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        self.register(ClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
    }
}


//MARK: - MKMapViewDelegate
// для изменения вида отображение обьектов на карте, с более подробной информации
extension CustomMapView: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is EventMapPin
            else { return nil }
        
        let view = EventAnnotationView(annotation: annotation, reuseIdentifier: EventAnnotationView.reuseID)
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
