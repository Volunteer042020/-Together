//
//  UITableView+setupFooter.swift
//  Together
//
//  Created by Anastasia Reyngardt on 27.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


extension UITableView {
    
    func setupFooter() {
        self.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 1))
    }
}


