//
//  MainViewController.swift
//  Together
//
//  Created by Anastasia Reyngardt on 13.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


final class MainViewController: UITabBarController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .white
        setNavigation()
    }
    
    //MARK: - Private metods
    private func setNavigation() {
        navigationController?.navigationBar.isHidden = true
        self.tabBar.tintColor = UIColor.customGray
        //TODO: ------------------------------------------ ДОБАВИТЬ ФОТО, подумать как оптимизировать код
        if let navControllers = self.viewControllers as? [UINavigationController],
            navControllers.count == 3
        {
            navControllers[0].setTabBarTitleAndImage(tabBarImageName: "profile", tabBarTitle: "Профиль")
            navControllers[1].setTabBarTitleAndImage(tabBarImageName: "map", tabBarTitle: "Карта")
            navControllers[2].setTabBarTitleAndImage(tabBarImageName: "chat", tabBarTitle: "Чат")
        }
        
        // отображать первую карту при входе в приложение
        if let selectedVC = self.viewControllers?.first(where: { $0.tabBarItem.title == "Карта" }) {
            self.selectedViewController = selectedVC
        }
    }
    
}
