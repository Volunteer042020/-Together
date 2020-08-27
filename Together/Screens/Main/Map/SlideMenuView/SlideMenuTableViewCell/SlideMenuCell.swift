//
//  SlideMenuTableViewCell.swift
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

class SlideMenuCell: UITableViewCell, ReusableView {
    
    static var nib: UINib = {
       UINib(nibName: "SlideMenuCell", bundle: nil)
    }()
    
    @IBOutlet private weak var helpImage: UIImageView!
    @IBOutlet private weak var helpCategoryLabel: UILabel!
    
    
    func showCategory(_ category: Category) {
        helpCategoryLabel.text = category.name
        helpImage.image = UIImage(systemName: category.imageName)
        helpImage.tintColor = category.color
    }
}
