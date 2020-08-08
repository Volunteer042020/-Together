//
//  SlideMenuViewCoordinator.swift
//  Together
//
//  Created by Евгений Шварцкопф on 03.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol SlideMenuCoordination: class {
    
}

final class SlideMenuCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    private let parentVC: MainMapViewController
    
    
    //MARK: - Init
    init(navController: UINavigationController, parentVC: MainMapViewController) {
        self.navController = navController
        self.parentVC = parentVC
    }
    
    //MARK: - Open properties
    override func start() {
        let vc = SlideMenuViewController()
        let presenter = SlideMenuPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        parentVC.addChild(vc)
        parentVC.slideMenuViewController = vc
    }
    
    //MARK: - Private metods
    
}

extension SlideMenuCoordinator: SlideMenuCoordination {
    
}
