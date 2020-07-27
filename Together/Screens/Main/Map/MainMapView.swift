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
    func showUserLocation(_ location: CLLocation)
    func showEventPins(_ pins: [EventMapPin])
}


final class MainMapView: UIView {
    
    //MARK: - Private properties
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        let zoomRage = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 20000) //TODO - считаю нужно убрать, т.к. например у нас человек в одном городе, а помощь нужна в соседнем селе, и т.к. мы ограничиваем масштабирование карты, он не можен посмотреть точки за пределами
        mapView.setCameraZoomRange(zoomRage, animated: true)
        mapView.userLocation.title = "Вы здесь" //TODO - Не вижу чтоб где-то отображалось
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        return mapView
    }()
    
    private lazy var trackingUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.blueLocationButton
        button.backgroundColor = UIColor.clear
        button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        
        button.layer.cornerRadius = trackingUserBtnHeight / 2
        button.clipsToBounds = true
        
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.grayLocationButton.cgColor
        button.layer.masksToBounds = false
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(tracKUserLocationInMap), for: .touchUpInside)
        return button
    }()
    
    private let trackingUserBtnHeight: CGFloat = 40.0
    
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
    
    //MARK: - Private metods
    private func setupUI() {
        setupMapView()
        setupTrackingUserButton()
    }
    
    private func setupMapView() {
        self.addSubview(mapView)
        
        mapView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setupTrackingUserButton() {
        mapView.addSubview(trackingUserButton)
        trackingUserButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 50).isActive = true
        trackingUserButton.rightAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.rightAnchor,
                                                  constant: -10).isActive = true
        trackingUserButton.heightAnchor.constraint(equalToConstant: trackingUserBtnHeight).isActive = true
        trackingUserButton.widthAnchor.constraint(equalTo: trackingUserButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    @objc private func tracKUserLocationInMap(_ sender: UIButton) {
        mapView.userTrackingMode = .follow
    }
    
}


//MARK: - MainMapViewImpl
extension MainMapView: MainMapViewImpl {
    
    func setPresenter(_ presenter: MainMapViewAction) {
        self.presenter = presenter
    }
    
    func showUserLocation(_ location: CLLocation) {
        mapView.centerToLocation(location)
        mapView.showsUserLocation = true
    }
    
    func showEventPins(_ pins: [EventMapPin]) {
        mapView.addAnnotations(pins)
    }
    
}

//MARK: - MKMapViewDelegate
// для изменения вида отображение обьектов на карте, с более подробной информации
extension MainMapView: MKMapViewDelegate {
    
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
