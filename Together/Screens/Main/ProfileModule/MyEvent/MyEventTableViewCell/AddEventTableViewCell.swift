//
//  AddEventTableViewCell.swift
//  Together
//
//  Created by Евгений Шварцкопф on 23.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class AddEventTableViewCell: UITableViewCell {
    
    static let reuseId: String = "AddEventTableCell"
    static let nib: UINib = {
       UINib(nibName: "AddEventTableViewCell", bundle: nil)
    }()
    
    @IBOutlet weak var addEventButton: RoundedButtonWithShadow!
    
}
