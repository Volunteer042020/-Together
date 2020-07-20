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
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Профиль"
        
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(settingButtonAction))
        settingButton.tintColor = .customGray
        navigationItem.rightBarButtonItem = settingButton
    }
}


extension ProfileViewController: ProfileViewControllerImpl {
    
    func showAlertUserQuit() {
        let alert = UIAlertController(title: "Подтвердите выход", message: "Вы действительно хотите выйти?", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Да", style: .default) { (alert) in
            // вызываем фукнцию перехода
            self.presenter?.quitProfileAndShowSignIn()
            // завершаем сессию пользователя
            UserDefaults.standard.set(false, forKey: "UID")
            // убераем таб бар
            self.tabBarController?.tabBar.isHidden = true
            print("пользователь потвердил и я выполняю переход на другой экран")
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { (alert) in
            self.dismiss(animated: true, completion: nil)
            print("сообственно отклонил продолжаю работу в этом профиле")
        }
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func settingButtonAction(_ sender: UIButton) {
        self.presenter?.getProfileSettingView()
    }
}
