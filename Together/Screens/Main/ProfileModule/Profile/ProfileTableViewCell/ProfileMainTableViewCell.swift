//
//  ProfileMainTableViewCell.swift
//  Together
//
//  Created by Евгений Шварцкопф on 09.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class ProfileMainTableViewCell: UITableViewCell {
    
    static var reuseId: String = "MainTableCell"
    static var nib: UINib {
        UINib(nibName: "ProfileMainTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberPhoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    func modal() {
        nameLabel.text = "Виктория"
        numberPhoneLabel.text = "+7 906 998 90 09"
        emailLabel.text = "marinaBlaBla@icloud.com"
        aboutMeLabel.text = "Хочу сделать мир добрей и открытей! И начну с себя ввиде помощи нуждающемся!"
    }
    
}
