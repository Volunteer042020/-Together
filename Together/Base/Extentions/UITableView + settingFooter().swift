//
//  UITableView + settingFooter().swift
//  Together
//
//  Created by Евгений Шварцкопф on 09.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

extension UITableView {
    
     func settingFooter() {
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 1)
        footerView.backgroundColor = UIColor.clear
        self.tableFooterView = footerView
    }
    
}
