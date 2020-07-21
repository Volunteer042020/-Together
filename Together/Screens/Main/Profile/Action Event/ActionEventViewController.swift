//
//  ActionEventViewController.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

final class ActionEventViewController: UIViewController {
    
    //MARK: - Open properties
    
    // презентору сообщаем обо всех действиях и передаем данные, например: презентер, была нажата кнопка войти,
    var presenter: ActionEventViewAction?
    
    //MARK: - Private properties
    
    //вью просим отобразить контент
    private lazy var actionEventView = view as? ActionEventViewImpl
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = actionEventView, let presenter = presenter {
            view.setPresenter(presenter)
        }
        setNavigation()
    }
    
    //MARK: - Private metods
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
    private func setNavigation() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Активные мероприятия"
    }
}


extension ActionEventViewController: ActionEventViewControllerImpl {
    
}



