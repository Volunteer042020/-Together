//
//  ProfileCoordinator.swift
//  Together
//
//  Created by Евгений Шварцкопф on 15.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


protocol ProfileCoordination {
//    func showSignIn()
    func showProfileSetting()
    func showActionEvent()
    func showCompletionEvent()
    func showMyEvent()
}


final class ProfileCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }

    
    //MARK: - Open metods
    override func start() {
        let vc = ProfileViewController()
        let presenter = ProfilePresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: true)
    }
    
}


//MARK: - ProfileCoordination
extension ProfileCoordinator: ProfileCoordination {
    
    func showActionEvent() {
        let coordinator = ActionEventCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: coordinator)
        coordinator.start()
    }
    
    func showCompletionEvent() {
        let coordinator = CompletionEventCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: coordinator)
        coordinator.start()
    }
    
    func showMyEvent() {
        let coordinator = MyEventCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: coordinator)
        coordinator.start()
    }
    
    func showProfileSetting() {
        let coordinator = ProfileSettingCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: coordinator)
        coordinator.start()
    }

}

