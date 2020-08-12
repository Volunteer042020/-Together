//
//  Categories.swift
//  Together
//
//  Created by Евгений Шварцкопф on 13.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//
/*
cart.fill - Товары из магазина
person.3.fill - Физическая помощь
staroflife.fill - Товары из аптеки
house.fill - Помощь по дому
car.fill - Помощь перевозки вещей
 */

import UIKit

struct Categories {
    var name: String
    var imageName: String
    var color: UIColor
    
    static func getCategories() -> [Categories] {
        return [Categories(name: "Продукты", imageName: "cart.fill", color: .marineButton),
                Categories(name: "Физическая", imageName: "person.3.fill", color: .customGray),
                Categories(name: "Медикоменты", imageName: "staroflife.fill", color: .redButton),
                Categories(name: "По дому", imageName: "house.fill", color: .grayLocationButton),
                Categories(name: "С переездом", imageName: "car.fill", color: .blueButton)]
    }
}
