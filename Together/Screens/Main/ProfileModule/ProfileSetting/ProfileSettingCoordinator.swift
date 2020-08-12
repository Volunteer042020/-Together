//
//  ProfileSettingCoordinator.swift
//  Together
//
//  Created by Евгений Шварцкопф on 20.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ProfileSettingCoordination {
    func showSignIn()
}

final class ProfileSettingCoordinator: BaseCoordirator {
    
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    
    //MARK: - Open properties
    override func start() {
        let vc = ProfileSettingViewController()
        let presenter = ProfileSettingPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: true)
    }
    
}


//MARK: - ProfileSettingCoordination
extension ProfileSettingCoordinator: ProfileSettingCoordination {
    
    func showSignIn() {
        let signInListener: SignInShowing? = findListener(parent: self.parentCoordinator)
        signInListener?.showSignIn()
        let coordinator = signInListener as? Coordinator
        coordinator?.childCoordinators = []
        
        // завершаем сессию пользователя
        UserDefaults.standard.set(false, forKey: "UID")
    }
    
}

