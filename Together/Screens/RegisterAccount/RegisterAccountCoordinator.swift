//
//  RegisterAccountCoordinate.swift
//  Together
//
//  Created by Евгений Шварцкопф on 08.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol RegisterAccountCoordination {
    
}

final class RegisterAccountCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    
    //MARK: - Open properties
    override func start() {
        
        let vc: RegisterAccountViewController = UIStoryboard.main.instantiate()
        
        let presenter = RegisterAccountPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: false)
    }
    
    //MARK: - Private metods
    
}

extension RegisterAccountCoordinator: RegisterAccountCoordination {
    
}


