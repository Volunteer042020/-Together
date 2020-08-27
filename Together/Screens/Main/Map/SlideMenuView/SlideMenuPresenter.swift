//
//  SlideMenuViewPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 03.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

protocol SlideMenuViewAction: class, ViewAstions {
     func viewDidLoad()
}

protocol SlideMenuViewControllerImpl: class {
    func showCategories(_ categories: [Category])
}


final class SlideMenuPresenter {
    
    //MARK: - Private properties
    private weak var view: SlideMenuViewControllerImpl?
    private let coordinator: SlideMenuCoordination
    
    //MARK: - Init
    init(view: SlideMenuViewControllerImpl, coordinator: SlideMenuCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


 //MARK: - SlideMenuViewAction
extension SlideMenuPresenter: SlideMenuViewAction {
    
    func viewDidLoad() {
        let categories = MockCategoryRepo.sharedData.categories
        view?.showCategories(categories)
    }
    
    
    
}
