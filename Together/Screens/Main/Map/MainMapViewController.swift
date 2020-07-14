//
//  MainMapViewController.swift
//  Together
//
//  Created by Евгений Шварцкопф on 12.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit
import CoreLocation

final class MainMapViewController: UIViewController {
    
    //MARK: - Open properties
    
    // презентору сообщаем обо всех действиях и передаем данные, например: презентер, была нажата кнопка войти,
    var presenter: MainMapViewAction?
    var locationService = LocationManager()
    
//    var locationManager: CLLocationManager = {
//        let locationManager = CLLocationManager()
//
//        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
//        //Точность измерения самой системой - чем она лучше, тем больше энергии потребляеет приложение. Задаётся через набор k-констант. Старайтесь использовать ту точность, что реально важна для приложения
//        locationManager.distanceFilter = 10
//        //Свойство отвечает за фильтр дистанции - величину, лишь при изменении на которую будет срабатывать изменение локации
//
//        locationManager.pausesLocationUpdatesAutomatically = true
//        //Позволяет системе автоматически останавливать обновление локации для балансировщика энергии
//        locationManager.activityType = .other
//        //Через это свойство Вы можете указать тип действий, для которого используется геопозиция, это позволит системе лучше обрабатывать балансировку геопозиции
//        locationManager.showsBackgroundLocationIndicator = true
//        //С помощью этого свойства мы решаем, показывать или нет значок геопозиции для работы в фоновом режиме
//        return locationManager
//    }()
    
    //MARK: - Private properties
    
    //вью просим отобразить контент
    private lazy var mainMapView = view as? MainMapViewImpl
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = mainMapView, let presenter = presenter {
            view.setPresenter(presenter)
            locationService.mainMapView = view
            locationService.mainMapViewController = self
            locationService.checkLocationEnabled()
        }
        setNavigation()
    }
    
    //MARK: - Private metods
    
//    private func setupManager() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startUpdatingLocation()
//    }
//
//    private func checkLocationEnabled(_ view: MainMapViewImpl) {
//        if CLLocationManager.locationServicesEnabled() {
//            setupManager()
//            checkAuthorization(view)
//        } else {
//            showBasicAlert("У вас выключена служба локации.", "Хотите включить?", URL(string: "App-Prefs:root=LOCATION-SERVICES"))
//        }
//    }
//
//    private func checkAuthorization(_ view: MainMapViewImpl) {
//
//        switch CLLocationManager.authorizationStatus() {
//        //Если он не определён (то есть ни одного запроса на авторизацию не было, то попросим базовую авторизацию)
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//            view.showUserLocation(true)
//        //Если она ограничена или запрещена, то уведомим об отключении
//        case .restricted:
//            print("Отключаем локацию")
//        case .denied:
//            showBasicAlert("Вы запретили использования вашего местоположения.", "Хотите это изменить?", URL(string: UIApplication.openSettingsURLString))
//        //Если авторизация базовая, то попросим предоставить полную
//        case .authorizedWhenInUse:
//            print("Включаем базовые функции")
//            locationManager.requestAlwaysAuthorization()
//            locationManager.startUpdatingLocation()
//            view.showUserLocation(true)
//        case .authorizedAlways:
//            print("Я знаю что вы делаете")
//        }
//    }
    
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
    private func setNavigation() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Главная"
    }
}


extension MainMapViewController: MainMapViewControllerImpl {
    
}

//extension MainMapViewController: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // проверяем есть ли данные в locations после чего начинаем передавать их для отображения
//        if !locations.isEmpty {
//            let lon = locations[0].coordinate.longitude
//            let lat = locations[0].coordinate.latitude
//            let initialLocation = CLLocation(latitude: lat, longitude: lon)
//            if let view = mainMapView {
//                view.presentLocationUser(initialLocation)
//                view.showUserLocation(true)
//            }
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        //Если ошибку можно превратить в ошибку геопоозии, то сделаем это
//        guard let locationError = error as? CLError else {
//            //Иначе выведем как есть
//            print(error)
//            return
//        }
//        
//        //Если получилось, то можно получить локализованное описание ошибки
//        NSLog(locationError.localizedDescription)
//    }
//}

