//
//  MainMapPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 12.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//
import Foundation
import CoreLocation

protocol MainMapViewAction: class {
    func viewWillAppear()
    func eventPinDidTapped(pin: EventMapPin)
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
}

protocol MainMapViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
    func showCurrentLocation(_ currentLocation: CLLocation)
    func showEventPins(_ pins: [EventMapPin])
}


final class MainMapPresenter {
    
    //MARK: - Private properties
    private weak var view: MainMapViewControllerImpl?
    private let coordinator: MainMapCoordination
    
    private let geocodingService: GeocodingServiceImpl
    
    
    //MARK: - Init
    init(view: MainMapViewControllerImpl, coordinator: MainMapCoordination) {
        self.view = view
        self.coordinator = coordinator
        
        geocodingService = GeocodingService()
    }
}


//MARK: - MainMapViewAction
extension MainMapPresenter: MainMapViewAction {
    
    func viewWillAppear() {
        LocationServiceTwo.sharedInstance.delegate = self
        LocationServiceTwo.sharedInstance.startUpdatingLocation()
        
        //TODO: получаем от репо эвенты, пока мокнутый репозиторий
        let events = MockEventsRepo.sharedData.events
        
        //TODO нужны будут id для последующего соотношения пинов и евентов
        let pins = events.map { (event) -> EventMapPin in
            let pin = EventMapPin(id: 0,
                                  title: event.title,
                                  subtitle: event.address.addressDescription,
                                  coordinate: event.coordinate)
            
            return pin
        }
         view?.showEventPins(pins)
    }
    
    func eventPinDidTapped(pin: EventMapPin) {
        
    }
    
    
}


//MARK: - LocationServiceDelegate
extension MainMapPresenter: LocationServiceDelegate {
    
    func tracingLocation(currentLocation: CLLocation) {
        view?.showCurrentLocation(currentLocation)
    }
    
    func tracingLocationDidFailWithError(error: LocationServiceError) {
        //TODO - добавить обработку ошибок, алерты
    }
}
