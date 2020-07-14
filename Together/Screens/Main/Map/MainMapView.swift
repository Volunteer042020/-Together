//
//  MainMapView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 12.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit
import MapKit

protocol MainMapViewImpl {
    //функции типа, покажи данные
    func setPresenter(_ presenter: MainMapViewAction)
    func presentLocationUser(_ location: CLLocation)
    func showUserLocation(_ value: Bool)
}

final class MainMapView: UIView {
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self        
        return mapView
    }()
    
    //MARK: - Private properties
    private var presenter: MainMapViewAction?
    
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
        setupMapView()
    }
    
    private func setupMapView() {
        self.addSubview(mapView)
        
        mapView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    
}

extension MainMapView: MainMapViewImpl {
    
    func setPresenter(_ presenter: MainMapViewAction) {
        self.presenter = presenter
    }
    
    func presentLocationUser(_ location: CLLocation) {
        mapView.centerToLocation(location)
    }
    
    func showUserLocation(_ value: Bool) {
        mapView.showsUserLocation = value
    }
    
}

extension MainMapView: MKMapViewDelegate {
    
}
