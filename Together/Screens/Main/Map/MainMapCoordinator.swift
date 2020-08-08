//
//  MainMapCoordinator.swift
//  Together
//
//  Created by Евгений Шварцкопф on 12.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol MainMapCoordination {
    func setChildSlideMenuVC()
}

final class MainMapCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    private var mainMapVC: MainMapViewController?
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    //MARK: - Open properties
    override func start() {
        let vc = MainMapViewController()
        mainMapVC = vc
        let presenter = MainMapPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: true)
    }
    
    //MARK: - Private metods
}


  //MARK: - MainMapCoordination
extension MainMapCoordinator: MainMapCoordination {
    
    func setChildSlideMenuVC() {
        guard let parentVC = mainMapVC else { return }
        let coordinator = SlideMenuCoordinator(navController: navController, parentVC: parentVC)
        coordinator.setDependence(withChildCoordinator: self)
        coordinator.start()
    }
    
    
}
