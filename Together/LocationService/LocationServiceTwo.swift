//
//  LocationManager.swift
//  Together
//
//  Created by Anastasia Reyngardt on 24.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import CoreLocation

//TODO: - инфо лист изменить - запрашивать местоположение только requestWhenInUseAuthorization, заменить текст сообщения "Возможность определения вашего местоположения позволит показать вам ближайшие активные просьбы помощи" ВОПРОС, покажет ли другим местоположение?

protocol LocationServiceDelegate {
    func tracingLocation(currentLocation: CLLocation)
    func tracingLocationDidFailWithError(error: LocationServiceError)
}

enum LocationServiceError {
    case turnOnLocationService //вернуться в настройки и поменять, нет прав
}


final class LocationServiceTwo: NSObject {
    
    //MARK: - Open properties
    static let sharedInstance = LocationServiceTwo()
    var delegate: LocationServiceDelegate?
    
    //MARK: - Private properties
    private let locationManager: CLLocationManager
    
    //MARK: - Init
    override private init() {
        locationManager = CLLocationManager()
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            // Тут 2 варианта, почитать про оба и определиться
            // 1. requestAlwaysAuthorization
            // 2. requestWhenInUseAuthorization
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 10
        locationManager.allowsBackgroundLocationUpdates = true
        
        super.init()
        locationManager.delegate = self
    }
    
    //MARK: - Open metods
    func startUpdatingLocation() {
        self.locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        self.locationManager.stopUpdatingLocation()
    }
    
    //MARK: - Private metods
    private func updateLocation(currentLocation: CLLocation){
        
        guard let delegate = self.delegate
            else { return }
        
        delegate.tracingLocation(currentLocation: currentLocation)
    }
    
    private func updateLocationDidFailWithError(error: LocationServiceError) {
        
        guard let delegate = self.delegate else {
            return
        }
        
        delegate.tracingLocationDidFailWithError(error: error)
    }
}


// MARK: - CLLocationManagerDelegate
extension LocationServiceTwo: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let newLocation = locations.last
            else { return }
        
        updateLocation(currentLocation: newLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        if (error as NSError).domain == kCLErrorDomain && (error as NSError).code == CLError.Code.denied.rawValue {
            
            // Пользователь запретил вашему приложению доступ к информации о местоположении
            updateLocationDidFailWithError(error: .turnOnLocationService)
        }
    }
}
