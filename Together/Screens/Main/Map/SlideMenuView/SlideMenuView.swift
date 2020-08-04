//
//  SlideMenuView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 03.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol SlideMenuViewImpl {
    //функции типа, покажи данные
    func setPresenter(_ presenter: SlideMenuViewAction)
}

final class SlideMenuView: UIView {
    
    var presenter: SlideMenuViewAction?
    
    //MARK: - Private properties
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        
        // add image in left part textField
        let imageView = UIImageView()
        let image = UIImage(systemName: "magnifyingglass")
        imageView.image = image
        imageView.tintColor = UIColor.blueLocationButton
        textField.leftView = imageView
        
        textField.placeholder = "Поиск помощи по категории"
        textField.tintColor = UIColor.blueLocationButton
        textField.backgroundColor = UIColor.grayLocationButton
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    //MARK: - Init
     override init(frame: CGRect) {
         super.init(frame: frame)
         setupUI()
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         setupUI()
     }
    
    //MARK: - Private metods
    fileprivate func setupUI() {
        self.backgroundColor = UIColor.white
        setupLineView()
        setupSearchTextField()
    }
    
    private func setupLineView() {
//        lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        lineView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        lineView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    
    private func setupSearchTextField() {
//        searchTextField.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 5).isActive = true
//        searchTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: sideArchoreConctant).isActive = true
//        searchTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -sideArchoreConctant).isActive = true
//        searchTextField.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 0).isActive = true
//        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}


extension SlideMenuView: SlideMenuViewImpl {
    
    func setPresenter(_ presenter: SlideMenuViewAction) {
        self.presenter = presenter
    }
}

