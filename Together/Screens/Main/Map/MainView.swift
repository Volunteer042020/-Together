//
//  MainMapView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 12.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit
import MapKit

//TODO: - Вынести кнопку компаса на карту, сделать кластеры при уменьшении карты

protocol MainMapViewImpl {
    func showUserLocation(_ location: CLLocation)
    func showEventPins(_ pins: [EventMapPin])
    
}


final class MainView: UIView {
    
    //MARK: - Private properties
    private lazy var mapView: CustomMapView = {
        let mapView = CustomMapView()
        return mapView
    }()
    
    private var presenter: MainViewActions?
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: - Private metods
    private func setupUI() {
        setupMapView()
    }
    
    private func setupMapView() {
        self.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.leftAnchor
            .constraint(equalTo: self.leftAnchor).isActive = true
        mapView.rightAnchor
            .constraint(equalTo: self.rightAnchor).isActive = true
        mapView.bottomAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}


//MARK: - MainMapViewImpl
extension MainView: MainMapViewImpl {
    
    func showUserLocation(_ location: CLLocation) {
        mapView.centerToLocation(location)
        mapView.showsUserLocation = true
    }
    
    func showEventPins(_ pins: [EventMapPin]) {
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        mapView.addAnnotations(pins)
    }
}


//MARK: - MainMapViewImpl
extension MainView: PresenterHaving {
    func setPresenter(_ presenter: ViewAstions) {
        if let presenter = presenter as? MainViewActions {
            self.presenter = presenter
            mapView.setPresenter(presenter)
        }
    }
}

