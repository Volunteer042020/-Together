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
    func showUserLocation(_ location: CLLocation)
    func showEventPins(_ pins: [EventMapPin])
}


final class MainView: UIView {
    
    //MARK: - Private properties
    private lazy var mapView: CustomMapView = {
        let mapView = CustomMapView()
        return mapView
    }()
    
    private lazy var trackingUserButton: UIButton = {
        let button = RoundMapButton(type: .system)
        button.setImage(systemName: "location.fill")
        button.addTarget(self, action: #selector(trackingUserButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var plusAreaButton: UIButton = {
        let button = RoundMapButton(type: .system)
        button.setImage(systemName: "plus")
        button.addTarget(self, action: #selector(plusAreaButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var minusAreaButton: UIButton = {
        let button = RoundMapButton(type: .system)
        button.setImage(systemName: "minus")
        button.addTarget(self, action: #selector(minusAreaButtonTapped), for: .touchUpInside)
        return button
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
        setupTrackingUserButton()
        setupPlusAreaButton()
        setupMinusAreaButton()
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
    
    private func setupTrackingUserButton() {
        mapView.addSubview(trackingUserButton)
        
        trackingUserButton.translatesAutoresizingMaskIntoConstraints = false
        trackingUserButton.topAnchor
            .constraint(equalTo: mapView.topAnchor, constant: 50).isActive = true
        trackingUserButton.rightAnchor
            .constraint(equalTo: mapView.safeAreaLayoutGuide.rightAnchor,
                        constant: -rightPaddingOfButton).isActive = true
        trackingUserButton.heightAnchor
            .constraint(equalToConstant: roundMapButtonHeight).isActive = true
        trackingUserButton.widthAnchor
            .constraint(equalTo: trackingUserButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func setupPlusAreaButton() {
        mapView.addSubview(plusAreaButton)
        
        plusAreaButton.translatesAutoresizingMaskIntoConstraints = false
        plusAreaButton.bottomAnchor
            .constraint(equalTo: self.centerYAnchor).isActive = true
        plusAreaButton.rightAnchor
            .constraint(equalTo: mapView.safeAreaLayoutGuide.rightAnchor, constant: -rightPaddingOfButton).isActive = true
        plusAreaButton.heightAnchor
            .constraint(equalToConstant: roundMapButtonHeight).isActive = true
        plusAreaButton.widthAnchor
            .constraint(equalTo: plusAreaButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func setupMinusAreaButton() {
        mapView.addSubview(minusAreaButton)
        
        minusAreaButton.translatesAutoresizingMaskIntoConstraints = false
        minusAreaButton.topAnchor
            .constraint(equalTo: plusAreaButton.bottomAnchor, constant: 5).isActive = true
        minusAreaButton.rightAnchor
            .constraint(equalTo: mapView.safeAreaLayoutGuide.rightAnchor,
                        constant: -rightPaddingOfButton).isActive = true
        minusAreaButton.heightAnchor
            .constraint(equalToConstant: roundMapButtonHeight).isActive = true
        minusAreaButton.widthAnchor
            .constraint(equalTo: minusAreaButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    @objc private func trackingUserButtonTapped() {
        mapView.userTrackingMode = .follow
    }
    
    @objc private func plusAreaButtonTapped() {
        mapView.zoomMap(byFactor: 1)
    }
    
    @objc private func minusAreaButtonTapped() {
        mapView.zoomMap(byFactor: -1)
    }
}


//MARK: - MainMapViewImpl
extension MainView: MainMapViewImpl {
    
//    func setPresenter(_ presenter: MainMapViewActions) {
//        self.presenter = presenter
//        //mapView.setPresenter(presenter)
//    }
    
    func showUserLocation(_ location: CLLocation) {
        mapView.centerToLocation(location)
        mapView.showsUserLocation = true
    }
    
    func showEventPins(_ pins: [EventMapPin]) {
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


//MARK: - Size properties
extension MainView {
    
    private var roundMapButtonHeight: CGFloat { return 40.0 }
    private var rightPaddingOfButton: CGFloat { return 10.0 }
}
