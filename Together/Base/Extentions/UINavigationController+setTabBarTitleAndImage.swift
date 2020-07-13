//
//  UINavigationController+setTabBarTitleAndImage.swift
//  Together
//
//  Created by Anastasia Reyngardt on 13.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


extension UINavigationController {
    
    //TODO: --------------------------------------------------------------- проверить теги, возможно нужен tagCounter
    func setTabBarTitleAndImage(tabBarImageName imageName: String,
                                     tabBarTitle title: String) {
        let itemImage = UIImage(named: imageName)
        self.tabBarItem = UITabBarItem(title: title,
                                                image: itemImage,
                                                tag: 0)
    }
}
