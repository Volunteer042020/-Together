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
    
    private lazy var compassButton: MKCompassButton = {
        let compass = MKCompassButton(mapView: self)
        compass.compassVisibility = .adaptive
        return compass
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
    
    //MARK: - Private metods
    private func setupUI() {
        self.userLocation.title = "Вы здесь"
        self.delegate = self
        self.showsCompass = false
        
        setupCompassButton()
        setupTrackingUserButton()
        setupPlusAreaButton()
        setupMinusAreaButton()
        registerAnnotationViewClasses()
    }
    
    private func setupCompassButton() {
        self.addSubview(compassButton)
        
        compassButton.translatesAutoresizingMaskIntoConstraints = false
        compassButton.topAnchor
            .constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        compassButton.rightAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                        constant: -rightPaddingOfButton).isActive = true
        compassButton.heightAnchor
            .constraint(equalToConstant: roundMapButtonDiameter).isActive = true
        compassButton.widthAnchor
            .constraint(equalTo: compassButton.heightAnchor, multiplier: 1).isActive = true
    }
    private func setupTrackingUserButton() {
        self.addSubview(trackingUserButton)
        
        trackingUserButton.translatesAutoresizingMaskIntoConstraints = false
        trackingUserButton.topAnchor
            .constraint(equalTo: compassButton.bottomAnchor, constant: 5).isActive = true
        trackingUserButton.rightAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                        constant: -rightPaddingOfButton).isActive = true
        trackingUserButton.heightAnchor
            .constraint(equalToConstant: roundMapButtonDiameter).isActive = true
        trackingUserButton.widthAnchor
            .constraint(equalTo: trackingUserButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func setupPlusAreaButton() {
        self.addSubview(plusAreaButton)
        
        plusAreaButton.translatesAutoresizingMaskIntoConstraints = false
        plusAreaButton.bottomAnchor
            .constraint(equalTo: self.centerYAnchor).isActive = true
        plusAreaButton.rightAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -rightPaddingOfButton).isActive = true
        plusAreaButton.heightAnchor
            .constraint(equalToConstant: roundMapButtonDiameter).isActive = true
        plusAreaButton.widthAnchor
            .constraint(equalTo: plusAreaButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func setupMinusAreaButton() {
        self.addSubview(minusAreaButton)
        
        minusAreaButton.translatesAutoresizingMaskIntoConstraints = false
        minusAreaButton.topAnchor
            .constraint(equalTo: plusAreaButton.bottomAnchor, constant: 5).isActive = true
        minusAreaButton.rightAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                        constant: -rightPaddingOfButton).isActive = true
        minusAreaButton.heightAnchor
            .constraint(equalToConstant: roundMapButtonDiameter).isActive = true
        minusAreaButton.widthAnchor
            .constraint(equalTo: minusAreaButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func registerAnnotationViewClasses() {
        self.register(EventAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        self.register(ClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
    }
    
    @objc private func trackingUserButtonTapped() {
        self.setUserTrackingMode(.follow, animated: true)
    }
    
    @objc private func plusAreaButtonTapped() {
        self.zoomMap(byFactor: 1)
    }
    
    @objc private func minusAreaButtonTapped() {
        self.zoomMap(byFactor: -1)
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


//MARK: - Size properties
private extension CustomMapView {
    private var roundMapButtonDiameter: CGFloat { return 40.0 }
    private var rightPaddingOfButton: CGFloat { return 10.0 }
}
