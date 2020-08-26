//
//  MyEventTableViewCell.swift
//  Together
//
//  Created by Евгений Шварцкопф on 23.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class MyEventTableViewCell: UITableViewCell {
    
    static let reuseId: String = "MyEventTableCell"
    static let nib: UINib = {
       UINib(nibName: "MyEventTableViewCell", bundle: nil)
    }()
    
    @IBOutlet weak var nameHelpLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    func modal(indexPath: IndexPath, lastIndex: Int) {
        // to do надо подумать, как сделать более приятней код
        
        if indexPath.row != lastIndex - 2 {
            nameHelpLabel.text = "Иван"
            descriptionLabel.text = "Купить продуктов в магазине. Хлеб, мука, яйца и молоко и потом бла бла бла бла бла бла бла бла"
            statusLabel.text = "Выполняется"
            timeLabel.text = "24.08.2020 15:03"
        } else {
            nameHelpLabel.text = "Иван"
            descriptionLabel.text = "Купить продуктов в магазине. Хлеб, мука, яйца и молоко и потом бла бла бла бла бла бла бла бла"
            statusLabel.text = "Выполняется"
            timeLabel.text = "24.08.2020 15:03"
            lineView.isHidden = true
        }
    }
}
