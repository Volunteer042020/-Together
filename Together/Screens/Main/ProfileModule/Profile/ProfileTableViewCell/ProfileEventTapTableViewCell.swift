//
//  ProfileEventTapTableViewCell.swift
//  Together
//
//  Created by Евгений Шварцкопф on 09.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class ProfileEventTapTableViewCell: UITableViewCell {
    
    static var reuseId: String = "EventTapTableCell"
    static var nib: UINib {
        UINib(nibName: "ProfileEventTapTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var nameEvent: UILabel!
    @IBOutlet weak var liveView: UIView!
    
}
