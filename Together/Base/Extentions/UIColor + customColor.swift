//
//  UIColor + customColor.swift
//  Together
//
//  Created by Евгений Шварцкопф on 08.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

// MARK: Custom Color для кнопок и текста.

extension UIColor {
    
    static var greenButton = UIColor(r: 61, g: 156, b: 77)
    static var blueButton = UIColor(r: 1, g: 148, b: 200)
    static var marineButton = UIColor(r: 0, g: 150, b: 136)
    static var redButton = UIColor(r: 180, g: 55, b: 87)
    static var customGray = UIColor(r: 1, g: 17, b: 40)
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255,green: g/255, blue: b/255, alpha: 1)
    }
}
