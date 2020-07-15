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
    var locationService: LocationService?
    
    //MARK: - Private properties
    
    //вью просим отобразить контент
    private lazy var mainMapView = view as? MainMapViewImpl
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = mainMapView, let presenter = presenter {
            view.setPresenter(presenter)
            locationService = LocationService(view: view, viewController: self)
            view.getArtWork()
        }
        setNavigation()
    }
    
    //MARK: - Private metods
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
    private func setNavigation() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Главная"
    }
}


extension MainMapViewController: MainMapViewControllerImpl {
    
}

