//
//  ReusableView.swift
//  Together
//
//  Created by Anastasia Reyngardt on 27.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

protocol ReusableView: class {}


extension ReusableView {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
}
