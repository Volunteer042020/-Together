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
<<<<<<< HEAD
    // презентору сообщаем обо всех действиях и передаем данные, например: презентер, была нажата кнопка войти
=======
    
>>>>>>> 5f41fe2... Modification SlideMenuView
    var presenter: MainMapViewActions?
    var slideMenuViewController: SlideMenuViewController?
    
    //MARK: - Private properties
<<<<<<< HEAD
    //вью просим отобразить контент
    private lazy var mainView = view as? (MainMapViewImpl & PresenterHaving)
<<<<<<< HEAD
=======
    //private var visualEffectView: UIVisualEffectView?
    
    private let slideMenuViewControllerHeight: CGFloat = 135
>>>>>>> b159e9a... Add a child SlideMenuМiewСontroller through the coordinator
=======
    private lazy var mainView = view as? (MainMapViewImpl & PresenterHaving)
>>>>>>> 5f41fe2... Modification SlideMenuView
    
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
<<<<<<< HEAD
        presenter?.viewDidLoad()
=======
        presenter?.setupSlideMenu()
        showSlideMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
>>>>>>> b159e9a... Add a child SlideMenuМiewСontroller through the coordinator
    }
    
    //MARK: - Private metods
<<<<<<< HEAD
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
<<<<<<< HEAD
=======
    private func showSlideMenu() {
        // to do ..
//        visualEffectView = UIVisualEffectView()
//        visualEffectView?.frame = self.view.frame
//        guard let visualView = visualEffectView else { return }

//        self.view.addSubview(visualView)
        guard let slideViewController = slideMenuViewController else { return }
        slideViewController.view.frame = CGRect(x: 0,
                                                y: self.view.frame.height - slideMenuViewControllerHeight ,
                                                width: self.view.frame.width,
                                                height: slideMenuViewControllerHeight)
        
        //self.addChild(slideViewController)
=======
    private func showSlideMenu() {

        guard let slideViewController = slideMenuViewController
            else { return }
        
>>>>>>> 5f41fe2... Modification SlideMenuView
        self.view.addSubview(slideViewController.view)
    }
    
>>>>>>> b159e9a... Add a child SlideMenuМiewСontroller through the coordinator
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

