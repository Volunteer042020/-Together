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
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
}

protocol MainMapViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
    func showCurrentLocation(_ currentLocation: CLLocation)
}


final class MainMapPresenter {
    
    //MARK: - Private properties
    private weak var view: MainMapViewControllerImpl?
    private let coordinator: MainMapCoordination
    
    
    //MARK: - Init
    init(view: MainMapViewControllerImpl, coordinator: MainMapCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension MainMapPresenter: MainMapViewAction {
    
    func viewWillAppear() {
        LocationServiceTwo.sharedInstance.delegate = self
        LocationServiceTwo.sharedInstance.startUpdatingLocation()
    }
}


extension MainMapPresenter: LocationServiceDelegate {
    
    func tracingLocation(currentLocation: CLLocation) {
        view?.showCurrentLocation(currentLocation)
    }
    
    func tracingLocationDidFailWithError(error: LocationServiceError) {
        
    }
}
