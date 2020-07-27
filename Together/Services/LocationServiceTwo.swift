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

//TODO - отобразить ошибки во вью
enum LocationServiceError {
    case locationServiceIsDisabled //у вас выключена служба локации
    case accessRestricted //доступ к локации ограничен
    case unknownError
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
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 10
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.delegate = self
        
        checkLocationServices()
    }
    
    //MARK: - Open metods
    func startUpdatingLocation() {
        self.locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        self.locationManager.stopUpdatingLocation()
    }
    
    //MARK: - Private metods
    private func checkLocationServices() {
        
           if CLLocationManager.locationServicesEnabled() {
               checkLocationAuthorization()
           } else {
            updateLocationDidFailWithError(error: .locationServiceIsDisabled)
           }
       }
    
    private func checkLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
          locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted: // Show an alert letting them know what’s up
            updateLocationDidFailWithError(error: .accessRestricted)
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            updateLocationDidFailWithError(error: .unknownError)
        }
        
    }
    
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
    
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let newLocation = locations.last
            else { return }
        
        updateLocation(currentLocation: newLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        if (error as NSError).domain == kCLErrorDomain && (error as NSError).code == CLError.Code.denied.rawValue {
            
            // Пользователь запретил вашему приложению доступ к информации о местоположении
            updateLocationDidFailWithError(error: .accessRestricted)
        }
    }
}
