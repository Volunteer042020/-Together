//
//  MainCoordinator.swift
//  Together
//
//  Created by Anastasia Reyngardt on 13.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

//Координатор тап бара, который создает дочерние на каждый тап

final class MainCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    private let profileNavController: UINavigationController
    private let mapNavController: UINavigationController
    private let chatNavController: UINavigationController
    
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController

        profileNavController = UINavigationController()
        mapNavController = UINavigationController()
        chatNavController = UINavigationController()
    }
    
    
    //MARK: - Open metods
    override func start() {
        let mainVC = MainViewController()
        navController.setViewControllers([mainVC], animated: false)
        mainVC.viewControllers = [profileNavController, mapNavController, chatNavController]
        
        showProfile()
        showMap()
        showChat()
    }
    
    
    //MARK: - Private metods
    private func showProfile() {
        let coordinator = ProfileCoordinator(navController: profileNavController)
        self.setDependence(withChildCoordinator: coordinator)
        coordinator.start()
    }
    
    private func showMap() {
        let coordinator = MainMapCoordinator(navController: mapNavController)
        self.setDependence(withChildCoordinator: coordinator)
        coordinator.start()
    }
    
    private func showChat() {
        //         let coordinator = ChatCoordinator()
        //        setDependence(withChildCoordinator: coordinator)
        //        coordinator.start()
    }
    
}
