//
//  RestorePasswordCoordinator.swift
//  Together
//
//  Created by Евгений Шварцкопф on 09.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol RestorePasswordCoordination {
    
}

final class RestorePasswordCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    
    //MARK: - Open properties
    override func start() {
        
        let vc = RestorePasswordViewController()
        
        let presenter = RestorePasswordPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: true)
    }
    
    //MARK: - Private metods
    
}

extension RestorePasswordCoordinator: RestorePasswordCoordination {
    
}
