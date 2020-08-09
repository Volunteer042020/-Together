//
//  ProfileSettingMainTableViewCell.swift
//  Together
//
//  Created by Евгений Шварцкопф on 09.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class ProfileSettingMainTableViewCell: UITableViewCell {
    
    static let reuseId: String = "SettingMainTableCell"
    static let nib: UINib = {
        UINib(nibName: "ProfileSettingMainTableViewCell", bundle: nil)
    }()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var newNameTextField: GrayTextField!
    @IBOutlet weak var lineView: UIView!
    
    func modal(indexPath: IndexPath) {
        if indexPath.row == 0 {
            nameLabel.text = "Имя"
            newNameTextField.placeholder = "Ваше имя"
            newNameTextField.maxLength = 15
        } else {
            nameLabel.text = "О Себе"
            newNameTextField.placeholder = "Любые подробности о вас..."
            newNameTextField.maxLength = 40
            lineView.isHidden = true
        }
    }
}
