//
//  MyEventCoordinator.swift
//  Together
//
//  Created by Евгений Шварцкопф on 10.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol MyEventCoordination {
    
}


final class MyEventCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    //MARK: - Open metods
    override func start() {
        let vc = MyEventViewController()
        let presenter = MyEventPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: true)
    }
}


//MARK: - MyEventCoordination
extension MyEventCoordinator: MyEventCoordination {
    
}


