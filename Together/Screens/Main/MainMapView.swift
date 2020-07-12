//
//  MainMapView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 12.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol MainMapViewImpl {
    //функции типа, покажи данные
    func setPresenter(_ presenter: MainMapViewAction)
}

final class MainMapView: UIView {
    
    // переменная для использования менеджера
    private var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        //Точность измерения самой системой - чем она лучше, тем больше энергии потребляеет приложение. Задаётся через набор k-констант. Старайтесь использовать ту точность, что реально важна для приложения
        locationManager.distanceFilter = 10
        //Свойство отвечает за фильтр дистанции - величину, лишь при изменении на которую будет срабатывать изменение локации
        
        locationManager.pausesLocationUpdatesAutomatically = true
        //Позволяет системе автоматически останавливать обновление локации для балансировщика энергии
        locationManager.activityType = .fitness
        //Через это свойство Вы можете указать тип действий, для которого используется геопозиция, это позволит системе лучше обрабатывать балансировку геопозиции
        locationManager.showsBackgroundLocationIndicator = true
        //С помощью этого свойства мы решаем, показывать или нет значок геопозиции для работы в фоновом режиме
        return locationManager
    }()
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
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
        
        mapView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
}

extension MainMapView: MainMapViewImpl {
    
    func setPresenter(_ presenter: MainMapViewAction) {
        self.presenter = presenter
    }

}


extension MainMapView: MKMapViewDelegate {

    
}

// для начального отображения, настройка радиуса.

private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 15000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

extension MainMapView: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //Статус авторизации
        switch status {
        //Если он не определён (то есть ни одного запроса на авторизацию не было, то попросим базовую авторизацию)
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        //Если она ограничена или запрещена, то уведомим об отключении
        case .restricted, .denied:
            print("Отключаем локацию")
        //Если авторизация базовая, то попросим предоставить полную
        case .authorizedWhenInUse:
            print("Включаем базовые функции")
            manager.requestAlwaysAuthorization()
        //Хи-хи
        case .authorizedAlways:
            print("Теперь мы знаем, с кем Вы трахаетесь")
        }
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // проверяем есть ли данные в locations после чего начинаем передавать их для отображения
        if !locations.isEmpty {
            let lon = locations[0].coordinate.longitude
            let lat = locations[0].coordinate.latitude
            let initialLocation = CLLocation(latitude: lat, longitude: lon)
            mapView.centerToLocation(initialLocation)
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
}
