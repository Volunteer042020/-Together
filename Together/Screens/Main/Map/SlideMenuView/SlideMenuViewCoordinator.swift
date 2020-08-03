//
//  SlideMenuViewCoordinator.swift
//  Together
//
//  Created by Евгений Шварцкопф on 03.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol SlideMenuCoordination {
    
}

final class SlideMenuViewCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    //MARK: - Open properties
    override func start() {
        let vc = SlideMenuViewController()
        let presenter = SlideMenuPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: true)
    }
    
    //MARK: - Private metods
    
}

extension SlideMenuViewCoordinator: SlideMenuCoordination {
    
}
