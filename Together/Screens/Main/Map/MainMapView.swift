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
    func getArtWork()
}

final class MainMapView: UIView {
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        let zoomRage = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 20000)
        mapView.setCameraZoomRange(zoomRage, animated: true)
        mapView.userLocation.title = "Вы здесь"
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        return mapView
    }()
    
    lazy var trackingUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.blueLocationButton
        button.backgroundColor = UIColor.clear
        button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.grayLocationButton.cgColor
        button.layer.masksToBounds = false
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(trackingUserLocationInMap), for: .touchDown)
        return button
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
        
        mapView.addSubview(trackingUserButton)
        trackingUserButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 100).isActive = true
        trackingUserButton.leftAnchor.constraint(equalTo: mapView.leftAnchor, constant: 345).isActive = true
        trackingUserButton.rightAnchor.constraint(equalTo: mapView.rightAnchor, constant: -30).isActive = true
        trackingUserButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}

extension MainMapView: MainMapViewImpl {
    
    @objc func trackingUserLocationInMap(_ sender: UIButton) {
        print("показываю пользователя")
        mapView.userTrackingMode = .follow
    }
    
    func setPresenter(_ presenter: MainMapViewAction) {
        self.presenter = presenter
    }
    
    func presentLocationUser(_ location: CLLocation) {
        mapView.centerToLocation(location)
    }
    
    func showUserLocation(_ value: Bool) {
        mapView.showsUserLocation = value
    }
  
    // проверка для построения точек на карте, здесь координаты из омска, в другом городе не увидеть, но работает))
    func getArtWork() {
        let artWork = Artwork(title: "Скульптура Любочка",
                              locationName: "Карла Либкнехта, 8А, Омск, Омская обл., 644099",
                              discipline: "Скульптура",
                              coordinate: CLLocationCoordinate2D(latitude: 54.9856985, longitude: 73.3747697))
        mapView.addAnnotation(artWork)
    }
}

// для изменения вида отображение обьектов на карте, с более подробной информации

extension MainMapView: MKMapViewDelegate {
    // 1 вызывается для каждой аннотации, которую я буду добавлять на карту
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2 проверка аннотация являеться ли она исскуством, а не пользователем
        guard let annotation = annotation as? Artwork else {
            return nil
        }
        // 3 создаем обьект MKMarkerAnnotationView для отображения изображения вместе маркеров
        let identifier = "artwork"
        var view: MKMarkerAnnotationView
        // 4  используются виды аннотаций, которые больше не видны.
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5 Здесь я создаю новый MKMarkerAnnotationView объект, если представление аннотации не может быть удалено из очереди
            view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}
