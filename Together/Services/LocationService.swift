//
//  LocationManager.swift
//  Together
//
//  Created by Евгений Шварцкопф on 14.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

// На удаление, так как не нужен 

import CoreLocation
import UIKit

final class LocationService: NSObject, CLLocationManagerDelegate {
    
    private var mapView: MainMapViewImpl?
    private var mapViewController: MainMapViewController?
    
    var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.distanceFilter = 10
        locationManager.pausesLocationUpdatesAutomatically = true
        locationManager.activityType = .other
        locationManager.showsBackgroundLocationIndicator = true
        return locationManager
    }()
    
    init(view: MainMapViewImpl, viewController: MainMapViewController) {
        super.init()
        self.mapView = view
        self.mapViewController = viewController
        self.configurate()
    }
    
    private func configurate() {
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        guard let view = mapView, let viewController = mapViewController else {
            return
        }
        checkLocationEnabled(view, viewController)
    }
    
    private func checkLocationEnabled(_ view: MainMapViewImpl,_ viewController: MainMapViewController) {
        if !CLLocationManager.locationServicesEnabled() {
            viewController.showBasicAlertMap("У вас выключена служба локации.", "Хотите включить?", URL(string: "App-Prefs:root=LOCATION-SERVICES"))
        }
    }
    
    private func checkAuthorization(_ view: MainMapViewImpl,_ viewController: MainMapViewController) {
        
        switch CLLocationManager.authorizationStatus() {
        //Если он не определён (то есть ни одного запроса на авторизацию не было, то попросим базовую авторизацию)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        //Если она ограничена или запрещена, то уведомим об отключении
        case .denied, .restricted:
            viewController.showBasicAlertMap("Вы запретили использования вашего местоположения.", "Хотите это изменить?", URL(string: UIApplication.openSettingsURLString))
        //Если авторизация базовая, то попросим предоставить полную
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        case .authorizedAlways:
            print("Я знаю что вы делаете")
        @unknown default:
            print("Если я напишу это в консоль, проверь меня!")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as? CLLocation
        let coord = locationObj?.coordinate
        
        if let lat = coord?.latitude, let lon = coord?.longitude {
            let initialLocation = CLLocation(latitude: lat, longitude: lon)
            if let view = mapView {
                view.showUserLocation(initialLocation)
                //view.showUserLocation(true)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //Если ошибку можно превратить в ошибку геопоозии, то сделаем это
        guard let locationError = error as? CLError else {
            //Иначе выведем как есть
            print(error)
            return
        }
        //Если получилось, то можно получить локализованное описание ошибки
        NSLog(locationError.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        // Проверяем статус локации и из switch case решаем какое действие будет делать
        guard let view = mapView, let viewController = mapViewController else {
            return
        }
        checkAuthorization(view, viewController)
    }
    
}

