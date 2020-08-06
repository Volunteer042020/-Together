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
    
}

final class SlideMenuView: UIView {
    
    var presenter: SlideMenuViewAction?
    
    //MARK: - Private properties
    
    private let slideViewHeight: CGFloat = 300
    private let slideHandleAreaHeight: CGFloat = 150
    private var slideVisible = false
    
    private var rightAnchorConstraint: NSLayoutConstraint?
    
    private lazy var lineView: UIView = {
        let view = UIView()

        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = SearchMapTextField()
        return textField
    }()
    
    private lazy var closedButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.blueButton
        button.setTitle("Отменить", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closedSlideMenuView)))
        return button
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
        setupSelfView()
        setupLineView()
        setupSearchTextField()
    }
    
    private func setupSelfView() {
        self.backgroundColor = UIColor.white
        self.alpha = 0.9
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 2
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }
    
    private func setupLineView() {
        self.addSubview(lineView)
        
        lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    
    private func setupSearchTextField() {
        self.addSubview(searchTextField)
        
        searchTextField.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 3).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: sideArchoreConctant).isActive = true
        
        rightAnchorConstraint = searchTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -sideArchoreConctant)
        rightAnchorConstraint?.isActive = true
        
        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchTextField.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openSlideMenuView)))
    }
    
    @objc private func openSlideMenuView(){
            UIView.animate(withDuration: 0.9,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {

                            self.frame.origin.y = self.frame.height - self.slideViewHeight
                            self.slideVisible = true
                            self.closedButton.isHidden = false
                            
                            self.rightAnchorConstraint?.isActive = false
                            self.rightAnchorConstraint = self.searchTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -100)
                            self.rightAnchorConstraint?.isActive = true
                            
                            self.addSubview(self.closedButton)
                            self.closedButton.leftAnchor.constraint(equalTo: self.searchTextField.rightAnchor, constant: 5).isActive = true
                            self.closedButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
                            self.closedButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
                            
            }, completion: nil)
    }
    
    @objc private func closedSlideMenuView() {
            UIView.animate(withDuration: 0.9,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                            
                            self.frame.origin.y = self.frame.height + self.slideHandleAreaHeight
                            self.slideVisible = true
                            self.closedButton.isHidden = true
                            self.rightAnchorConstraint?.isActive = false
                            self.rightAnchorConstraint = self.searchTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -self.sideArchoreConctant)
                            self.rightAnchorConstraint?.isActive = true
            }, completion: nil)
        }
    }
    


extension SlideMenuView: PresenterHaving {
    
    func setPresenter(_ presenter: ViewAstions) {
        if let presenter = presenter as? SlideMenuViewAction {
            self.presenter = presenter
        }
    }
}

