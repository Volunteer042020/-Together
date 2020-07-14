//
//  ProfileViewController.swift
//  Together
//
//  Created by Евгений Шварцкопф on 15.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    //MARK: - Open properties
    
    // презентору сообщаем обо всех действиях и передаем данные, например: презентер, была нажата кнопка войти,
    var presenter: ProfileViewAction?
    
    
    //MARK: - Private properties
    
    //вью просим отобразить контент
    private lazy var profileView = view as? ProfileViewImpl
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = profileView , let presenter = presenter {
            view.setPresenter(presenter)
        }
        
        setNavigation()
    }
    
    //MARK: - Private metods
    
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
    private func setNavigation() {
        self.navigationController?.navigationItem.title = "Восстановления пароля"
    }
}


extension ProfileViewController: ProfileViewControllerImpl {
    
}
