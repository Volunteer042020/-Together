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
        
        //TODO: ------------------------------------------ ДОБАВИТЬ ФОТО, подумать как оптимизировать код
        profileNavController = UINavigationController()
        profileNavController.setTabBarTitleAndImage(tabBarImageName: "profile", tabBarTitle: "Профиль")
        mapNavController = UINavigationController()
        mapNavController.setTabBarTitleAndImage(tabBarImageName: "map", tabBarTitle: "Карта")
        chatNavController = UINavigationController()
        chatNavController.setTabBarTitleAndImage(tabBarImageName: "chat", tabBarTitle: "Чат")
    }
    
    
    //MARK: - Open metods
    override func start() {
        let mainVC: MainViewController = UIStoryboard.main.instantiate()
        navController.setViewControllers([mainVC], animated: false)
        mainVC.viewControllers = [profileNavController, mapNavController, chatNavController]
        
        showProfile()
        showMap()
        showChat()
    }
    
    
    //MARK: - Private metods
    private func showProfile() {
        //        let coordinator = ProfileCoordinator()
        //        setDependence(withChildCoordinator: coordinator)
        //        coordinator.start()
    }
    
    private func showMap() {
        let mapCoordinator = MainMapCoordinator(navController: mapNavController)
        self.setDependence(withChildCoordinator: mapCoordinator)
        mapCoordinator.start()
    }
    
    private func showChat() {
        //         let coordinator = ChatCoordinator()
        //        setDependence(withChildCoordinator: coordinator)
        //        coordinator.start()
    }
    
}
