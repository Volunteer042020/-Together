//
//  ProfileCoordinator.swift
//  Together
//
//  Created by Евгений Шварцкопф on 15.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ProfileCoordination {
    func showSignIn()
}

final class ProfileCoordinator: BaseCoordirator {
    
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    
    //MARK: - Open properties
    override func start() {
        
        let vc: ProfileViewController = UIStoryboard.main.instantiate()
        
        let presenter = ProfilePresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: false)
    }
    //MARK: - Private metods
}

extension ProfileCoordinator: ProfileCoordination {
    
    func showSignIn() {
        navController.navigationItem.hidesBackButton = false
        let signCoordinator = SignInCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: signCoordinator)
        navController.interactivePopGestureRecognizer?.isEnabled = false
        signCoordinator.start()
        self.didFinish(coordinator: self)
        let mainView = MainCoordinator(navController: navController)
        mainView.didFinish(coordinator: mainView)
    }
}

