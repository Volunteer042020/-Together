//
//  LocationManager.swift
//  Together
//
//  Created by Евгений Шварцкопф on 14.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import CoreLocation
import UIKit

final class LocationService: NSObject, CLLocationManagerDelegate {
    
    private var mapView: MainMapViewImpl?
    private var mapViewController: MainMapViewController?
    
    var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()

        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        //Точность измерения самой системой - чем она лучше, тем больше энергии потребляеет приложение. Задаётся через набор k-констант. Старайтесь использовать ту точность, что реально важна для приложения
        locationManager.distanceFilter = 10
        //Свойство отвечает за фильтр дистанции - величину, лишь при изменении на которую будет срабатывать изменение локации

        locationManager.pausesLocationUpdatesAutomatically = true
        //Позволяет системе автоматически останавливать обновление локации для балансировщика энергии
        locationManager.activityType = .other
        //Через это свойство Вы можете указать тип действий, для которого используется геопозиция, это позволит системе лучше обрабатывать балансировку геопозиции
        locationManager.showsBackgroundLocationIndicator = true
        //С помощью этого свойства мы решаем, показывать или нет значок геопозиции для работы в фоновом режиме
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
        guard let view = mapView, let viewController = mapViewController else { return }
        checkLocationEnabled(view, viewController)
    }
    
    private func checkLocationEnabled(_ view: MainMapViewImpl,_ viewController: MainMapViewController) {
        if !CLLocationManager.locationServicesEnabled() {
            viewController.showBasicAlert("У вас выключена служба локации.", "Хотите включить?", URL(string: "App-Prefs:root=LOCATION-SERVICES"))
        }
    }

    private func checkAuthorization(_ view: MainMapViewImpl,_ viewController: MainMapViewController) {

        switch CLLocationManager.authorizationStatus() {
        //Если он не определён (то есть ни одного запроса на авторизацию не было, то попросим базовую авторизацию)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            view.showUserLocation(true)
        //Если она ограничена или запрещена, то уведомим об отключении
        case .denied, .restricted:
            viewController.showBasicAlert("Вы запретили использования вашего местоположения.", "Хотите это изменить?", URL(string: UIApplication.openSettingsURLString))
        //Если авторизация базовая, то попросим предоставить полную
        case .authorizedWhenInUse:
            print("Включаем базовые функции")
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            view.showUserLocation(true)
        case .authorizedAlways:
            print("Я знаю что вы делаете")
        @unknown default:
            print("Может здесь чего пройзайдот???")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // проверяем есть ли данные в locations после чего начинаем передавать их для отображения
//        if !locations.isEmpty {
//            let lon = locations[0].coordinate.longitude
//            let lat = locations[0].coordinate.latitude
//            let initialLocation = CLLocation(latitude: lat, longitude: lon)
//            if let view = mainMapView {
//                view.presentLocationUser(initialLocation)
//                view.showUserLocation(true)
//            }
//        }
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as? CLLocation
        let coord = locationObj?.coordinate

        if let lat = coord?.latitude, let lon = coord?.longitude {
            let initialLocation = CLLocation(latitude: lat, longitude: lon)
            if let view = mapView {
                view.presentLocationUser(initialLocation)
                view.showUserLocation(true)
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
        guard let view = mapView, let viewController = mapViewController else { return }
        checkAuthorization(view, viewController)
    }
    
}

