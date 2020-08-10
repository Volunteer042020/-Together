//
//  MyEventPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 10.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol MyEventViewAction: class, ViewAstions {
    
}

protocol MyEventViewControllerImpl: class {
    
}

final class MyEventPresenter {
    
    //MARK: - Private properties
    private weak var view: MyEventViewControllerImpl?
    private let coordinator: MyEventCoordination
    
    
    //MARK: - Init
    init(view: MyEventViewControllerImpl, coordinator: MyEventCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension MyEventPresenter: MyEventViewAction {

}
