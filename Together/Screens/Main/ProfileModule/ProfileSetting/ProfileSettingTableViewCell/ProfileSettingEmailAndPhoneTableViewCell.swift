//
//  ProfileSettingEmailAndPhoneTableViewCell.swift
//  Together
//
//  Created by Евгений Шварцкопф on 09.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class ProfileSettingEmailAndPhoneTableViewCell: UITableViewCell {
    
    static let reuseId: String = "EmailAndPhoneTableCell"
    static let nib: UINib = {
        UINib(nibName: "ProfileSettingEmailAndPhoneTableViewCell", bundle: nil)
    }()
    @IBOutlet weak var nameSettingLabel: UILabel!
    @IBOutlet weak var userSettingLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    func modal(indexPath: IndexPath) {
        if indexPath.row == 3 {
            nameSettingLabel.text = "Сменить номер:"
            userSettingLabel.text = "+7 (941) 784 43 34 "
        } else {
            nameSettingLabel.text = "Сменить почту:"
            userSettingLabel.text = "blablalba@icloud.com"
            lineView.isHidden = true
        }
    }
    
}
