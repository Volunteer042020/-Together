//
//  RoundButtonWithBorder.swift
//  Together
//
//  Created by Anastasia Reyngardt on 31.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


class RoundMapButton: UIButton {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    //MARK: - Open metods
    func setImage(systemName: String) {
        self.setImage(UIImage(systemName: systemName), for: .normal)
    }
    
    func addTouchUpTarget(selector: Selector) {
        self.addTarget(self, action: selector, for: .touchUpInside)
    }
    
    //MARK: - Private metods
    private func setupUI() {
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.grayLocationButton.cgColor
        self.layer.masksToBounds = false
        
        self.tintColor = UIColor.blueLocationButton
        self.backgroundColor = UIColor.clear
        
    }
    
}
