//
//  CompletionEventCoordinator.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol CompletionEventCoordination {
    
}

final class CompletionEventCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    
    //MARK: - Open properties
    override func start() {
        let vc = CompletionEventViewController()
        let presenter = CompletionEventPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: true)
    }
    
    //MARK: - Private metods
}


extension CompletionEventCoordinator: CompletionEventCoordination {
    
}
