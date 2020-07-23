//
//  CompletionEventPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

protocol CompletionEventViewAction: class {
    
}

protocol CompletionEventViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
}


final class CompletionEventPresenter {
    
    //MARK: - Private properties
    private weak var view: CompletionEventViewControllerImpl?
    private let coordinator: CompletionEventCoordination
    
    
    //MARK: - Init
    init(view: CompletionEventViewControllerImpl, coordinator: CompletionEventCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension CompletionEventPresenter: CompletionEventViewAction {
    
}
