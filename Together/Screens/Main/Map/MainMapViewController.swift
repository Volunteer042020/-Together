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
    //    Modification SlideMenuView
    var presenter: MainMapViewActions?
    var slideMenuViewController: SlideMenuViewController?
    
    //MARK: - Private properties
    //вью просим отобразить контент
    private lazy var mainView = view as? (MainMapViewImpl & PresenterHaving)
    
    private let slideMenuViewControllerHeight: CGFloat = 135
    
    //MARK: - Life cycle
    override func loadView() {
        view = MainView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let presenter = presenter {
            mainView?.setPresenter(presenter)
        }
        setNavigation()
        presenter?.viewDidLoad()

        presenter?.setupSlideMenu()
        showSlideMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    //MARK: - Private metods
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере

    private func showSlideMenu() {

        guard let slideViewController = slideMenuViewController
            else { return }
    
        self.view.addSubview(slideViewController.view)
    }
    
    private func setNavigation() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Главная"
    }
}


//MARK: - MainMapViewControllerImpl
extension MainMapViewController: MainMapViewControllerImpl {
    
    func showCurrentLocation(_ currentLocation: CLLocation) {
        mainView?.showUserLocation(currentLocation)
    }
    
    func showEventPins(_ pins: [EventMapPin]) {
        mainView?.showEventPins(pins)
    }
    
}

