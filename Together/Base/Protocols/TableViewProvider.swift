//
//  TableViewProvider.swift
//  Together
//
//  Created by Anastasia Reyngardt on 27.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


protocol TableViewProvider: class, UITableViewDelegate, UITableViewDataSource {
    
    init(tableView: UITableView)
}
