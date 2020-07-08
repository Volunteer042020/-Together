//
//  RegisterAccountViewController.swift
//  Together
//
//  Created by Евгений Шварцкопф on 08.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


final class RegisterAccountViewController: UIViewController {
    
    //MARK: - Open properties
    
    // презентору сообщаем обо всех действиях и передаем данные, например: презентер, была нажата кнопка войти,
    var presenter: RegisterAccountViewAction?
    
    
    //MARK: - Private properties
    
    //вью просим отобразить контент
    private lazy var registerAccountView = view as? RegisterAccountViewImpl
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = registerAccountView , let presenter = presenter {
            view.setPresenter(presenter)
        }
        
        setNavigation()
    }
    
    //MARK: - Private metods
    
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
    private func setNavigation() {
        self.navigationController?.navigationItem.title = "Регистрация"
    }
}


extension RegisterAccountViewController: RegisterAccountViewControllerImpl {
    
}
