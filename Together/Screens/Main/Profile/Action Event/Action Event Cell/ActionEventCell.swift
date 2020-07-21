//
//  ActionEventCell.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class ActionEventCell: UICollectionViewCell {
    
    @IBOutlet weak var helpNameLabel: UILabel?
    @IBOutlet weak var helpDescriptionLabel: UILabel?
    @IBOutlet weak var streetNameLabel: UILabel?
    @IBOutlet weak var mapImage: UIImageView?
    @IBOutlet weak var needyNameLabel: UILabel?
    @IBOutlet weak var photoNeedyImage: UIImageView?
    @IBOutlet weak var completionEventButton: RoundedButtonWithShadow!
    @IBOutlet weak var cancelEventButton: RoundedButtonWithShadow!
    
    func renderCell(model: Event) { // В дальнейшем сюда передаем класс
        helpNameLabel?.text = "Купить " + model.name
        helpDescriptionLabel?.text = model.description
        streetNameLabel?.text = model.street + " кв. " + model.apartment
        needyNameLabel?.text = model.nameNeedy
        completionEventButton.backgroundColor = UIColor.marineButton
        cancelEventButton.backgroundColor = UIColor.redButton
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
        self.backgroundColor = UIColor(r: 242, g: 242, b: 247)
        helpNameLabel?.textColor = UIColor.customGray
        helpDescriptionLabel?.textColor = UIColor.gray
        streetNameLabel?.textColor = UIColor.customGray
        mapImage?.tintColor = UIColor.marineButton
        needyNameLabel?.textColor = UIColor.customGray
        photoNeedyImage?.tintColor = UIColor.blueButton
    }
    
    @IBAction func cancelEventAction(_ sender: Any) {
        print("Сории я отказываюсь, у меня чп случилось! /n данный евет отправляется на карту")
    }
    
    @IBAction func completionEventAction(_ sender: Any) {
        print("ЕЕеееее я крутой и молодец, я выполнил!цпасибо! /n данный евент отправляется в архив")
    }
    
    
}
