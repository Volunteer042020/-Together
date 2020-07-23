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
    func showProfileSetting()
    func showActionEvent()
    func showCompletionEvent()
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
        
        let vc = ProfileViewController()
        let presenter = ProfilePresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: true)
    }
    //MARK: - Private metods
}

extension ProfileCoordinator: ProfileCoordination {
    
    func showActionEvent() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.customGray
        navController.navigationBar.topItem?.backBarButtonItem = backButton
        
        let actionEventCoordinator = ActionEventCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: actionEventCoordinator)
        actionEventCoordinator.start()
        self.didFinish(coordinator: self)
    }
    
    func showCompletionEvent() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.customGray
        navController.navigationBar.topItem?.backBarButtonItem = backButton
        
        let completionEventCoordinator = CompletionEventCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: completionEventCoordinator)
        completionEventCoordinator.start()
        self.didFinish(coordinator: self)
    }
    
    func showProfileSetting() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.customGray
        navController.navigationBar.topItem?.backBarButtonItem = backButton
        
        let profileSettingCoordinator = ProfileSettingCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: profileSettingCoordinator)
        profileSettingCoordinator.start()
        self.didFinish(coordinator: self)
    }
    
    func showSignIn() {
        let signCoordinator = SignInCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: signCoordinator)
        signCoordinator.start()
        self.didFinish(coordinator: self)
        let mainView = MainCoordinator(navController: navController) as MainCoordinator
        mainView.didFinish(coordinator: mainView)
    }
}

