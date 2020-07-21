//
//  CompletionEventCell.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//


import UIKit

class CompletionEventCell: UICollectionViewCell {
    
    @IBOutlet weak var helpNameLabel: UILabel?
    @IBOutlet weak var helpDescriptionLabel: UILabel?
    @IBOutlet weak var streetNameLabel: UILabel?
    @IBOutlet weak var mapImage: UIImageView?
    @IBOutlet weak var needyNameLabel: UILabel?
    @IBOutlet weak var photoNeedyImage: UIImageView?
    @IBOutlet weak var progressEventButton: RoundedButtonWithShadow?
    
    
    func renderCell(model: Event) { // В дальнейшем сюда передаем класс
        helpNameLabel?.text = "Купить " + model.name
        helpDescriptionLabel?.text = model.description
        streetNameLabel?.text = model.street + " кв. " + model.apartment
        needyNameLabel?.text = model.nameNeedy
        if model.progress < 1 {
            progressEventButton?.setTitle("ОТМЕНЕН", for: .normal)
            progressEventButton?.backgroundColor = UIColor.redButton
        } else if model.progress > 1 {
            progressEventButton?.setTitle("ВЫПОЛНЕН", for: .normal)
            progressEventButton?.backgroundColor = UIColor.marineButton
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIAndAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUIAndAction()
    }
    
    private func setupUIAndAction() {
        setupColor()
    }
    
    private func setupColor() {
        self.backgroundColor = UIColor.init(r: 242, g: 242, b: 247)
        helpNameLabel?.textColor = UIColor.customGray
        helpDescriptionLabel?.textColor = UIColor.gray
        streetNameLabel?.textColor = UIColor.customGray
        mapImage?.tintColor = UIColor.marineButton
        needyNameLabel?.textColor = UIColor.customGray
        photoNeedyImage?.tintColor = UIColor.blueButton
    }
}
