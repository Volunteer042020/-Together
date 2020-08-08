//
//  SearchMapTextField.swift
//  Together
//
//  Created by Евгений Шварцкопф on 06.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class SearchMapTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        self.leftViewMode = .always
        self.inputAccessoryView = getToolBar()
        
        self.tintColor = UIColor.grayLocationButton
        self.backgroundColor = UIColor.clear
        self.textColor = UIColor.darkGray
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 2
        self.layer.masksToBounds = false
        
        let attributeDict = [NSAttributedString.Key.foregroundColor: UIColor.grayLocationButton]
        self.attributedPlaceholder = NSAttributedString(string: " Поиск помощи по категории ", attributes: attributeDict)
        
        // add image in left part textField
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        let image = UIImage(systemName: "magnifyingglass")
        imageView.image = image
        let imageConteinerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageConteinerView.addSubview(imageView)
        self.leftView = imageConteinerView
    }
    
}
