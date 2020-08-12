//
//  CompletionEventViewController.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

final class CompletionEventViewController: UIViewController {
    
    //MARK: - Open properties
    
    // презентору сообщаем обо всех действиях и передаем данные, например: презентер, была нажата кнопка войти,
    var presenter: CompletionEventViewAction?
    
    //MARK: - Private properties
    
    //вью просим отобразить контент
    private lazy var completionEventView = view as? CompletionEventViewImpl
    
    //MARK: - Life cycle
    override func loadView() {
        view = CompletionEventView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = completionEventView, let presenter = presenter {
            view.setPresenter(presenter)
        }
        setNavigation()
    }
    
    //MARK: - Private metods
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
    private func setNavigation() {
        navigationItem.title = "Выполненые мероприятия"
        
        let backButton = UIBarButtonItem()
        backButton.title = "Профиль"
        backButton.tintColor = UIColor.customGray
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}


extension CompletionEventViewController: CompletionEventViewControllerImpl {
    
}


