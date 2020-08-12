//
//  MainMapPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 12.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//
import Foundation
import CoreLocation

protocol MainMapViewActions: class, ViewAstions {
    func viewDidLoad()
    func setupSlideMenu()
    func viewWillAppear()
}

protocol MainViewActions: class, ViewAstions {
    
}

protocol MapViewActions: class, ViewAstions {
    func eventPinDidTapped(pin: EventMapPin)
}

protocol MainMapViewControllerImpl: class {
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
extension MainMapPresenter: MainMapViewActions {
    
    func setupSlideMenu() {
        print("to do")
    }
    
    func viewWillAppear() {
        print("to do")
    }
    
    
    func viewDidLoad() {
        func setupSlideMenu() {
            coordinator.setChildSlideMenuVC()
        }
        
        
        func viewWillAppear() {
            
            LocationServiceTwo.sharedInstance.delegate = self
            LocationServiceTwo.sharedInstance.startUpdatingLocation()
            
            //TODO: получаем от репо эвенты, пока мокнутый репозиторий
            let events = MockEventsRepo.sharedData.events
            
            let pins = events.map { (event) -> EventMapPin in
                let pin = EventMapPin(id: event.id,
                                      title: event.title,
                                      subtitle: event.address.addressDescription,
                                      coordinate: event.coordinate)
                
                return pin
            }
            view?.showEventPins(pins)
        }
    }
}


//MARK: - MainViewActions
extension MainMapPresenter: MainViewActions {
    
}


//MARK: - MapViewActions
extension MainMapPresenter: MapViewActions {
    
    func eventPinDidTapped(pin: EventMapPin) {
        print("eventPinDidTapped")
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

