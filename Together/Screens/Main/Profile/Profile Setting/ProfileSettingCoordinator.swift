//
//  ProfileSettingCoordinator.swift
//  Together
//
//  Created by Евгений Шварцкопф on 20.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ProfileSettingCoordination {
    
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
    //MARK: - Private metods
}

extension ProfileSettingCoordinator: ProfileSettingCoordination {

}

