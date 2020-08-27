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

class SlideMenuTableViewCell: UITableViewCell {
    
    static var reuseId: String = "SlideMenuTableCell"
    static var nib: UINib = {
       UINib(nibName: "SlideMenuTableViewCell", bundle: nil)
    }()
    
    @IBOutlet weak var helpImage: UIImageView!
    @IBOutlet weak var helpCategoryLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    func showCategories(categories: [Category], indexPath: IndexPath) {
        let category = categories[indexPath.row]
        if indexPath.row <= 3 {
            helpCategoryLabel.text = category.name
            helpImage.image = UIImage(systemName: category.imageName)
            helpImage.tintColor = category.color
        } else {
            helpCategoryLabel.text = category.name
            helpImage.image = UIImage(systemName: category.imageName)
            helpImage.tintColor = category.color
            lineView.isHidden = true 
        }
    }
    
}
