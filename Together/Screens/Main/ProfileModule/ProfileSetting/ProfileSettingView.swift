//
//  ProfileSettingView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 20.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ProfileSettingViewImpl {
    //функции типа, покажи данные
    func setPresenter(_ presenter: ProfileSettingViewAction)
}


final class ProfileSettingView: UIView {
    
    //MARK: - Private properties
    private var presenter: ProfileSettingViewAction?
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginStack: UIStackView = {
        let stack = VerticalStack()
        return stack
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        return label
    }()
    
    lazy var nameUserTextField: GrayTextField = {
        let textField = GrayTextField()
        textField.placeholder = "Не указано"
        return textField
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Фамилия"
        return label
    }()
    
     lazy var lastNameUserTextField: GrayTextField = {
          let textField = GrayTextField()
          textField.placeholder = "Не указано"
          return textField
      }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        return label
    }()
    
    lazy var emailUserTextField: GrayTextField = {
        let textField = GrayTextField()
        textField.placeholder = "Не указано"
        return textField
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Телефон"
        return label
    }()
    
    lazy var phoneUserTextField: GrayTextField = {
        let textField = GrayTextField()
        textField.placeholder = "Не указано"
        return textField
    }()
    
    lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "О себе"
        return label
    }()
    
    lazy var aboutUserTextField: GrayTextField = {
        let textField = GrayTextField()
        textField.placeholder = "Не указано"
        return textField
    }()
    
    lazy var newSettingButton: UIButton = {
        let button = RoundedButtonWithShadow(type: .system)
        button.setTitle("ИЗМЕНИТЬ", for: .normal)
        button.titleLabel?.font = UIFont(name: "", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .marineButton
        
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
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
    
    private func setupUI() {
        self.backgroundColor = .white
        setupScrollView()
        setupProfileStack()
        setupSettingUserButton()
    }
    
    private func setupScrollView() {
        self.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                        constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,
                                         constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                          constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupProfileStack() {
        scrollView.addSubview(loginStack)
        
        loginStack.addArrangedSubview(nameLabel)
        loginStack.addArrangedSubview(nameUserTextField)
        loginStack.addArrangedSubview(lastNameLabel)
        loginStack.addArrangedSubview(lastNameUserTextField)
        loginStack.addArrangedSubview(emailLabel)
        loginStack.addArrangedSubview(emailUserTextField)
        loginStack.addArrangedSubview(phoneLabel)
        loginStack.addArrangedSubview(phoneUserTextField)
        loginStack.addArrangedSubview(aboutLabel)
        loginStack.addArrangedSubview(aboutUserTextField)
        
        loginStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        loginStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        loginStack.leftAnchor.constraint(equalTo: scrollView.leftAnchor,
                                         constant: sideArchoreConctant).isActive = true
        loginStack.rightAnchor.constraint(equalTo: scrollView.rightAnchor,
                                          constant: -sideArchoreConctant).isActive = true
    }
    
    private func setupSettingUserButton() {
        scrollView.addSubview(newSettingButton)
        
        newSettingButton.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 40).isActive = true
        newSettingButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: sideArchoreConctant).isActive = true
        newSettingButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -sideArchoreConctant).isActive = true
        newSettingButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        newSettingButton.bottomAnchor.constraint(equalToSystemSpacingBelow: scrollView.bottomAnchor, multiplier: 0).isActive = true
    }
    
}

extension ProfileSettingView: ProfileSettingViewImpl {
    
    func setPresenter(_ presenter: ProfileSettingViewAction) {
        self.presenter = presenter
    }
    
    @objc func showAlert(_: UIButton) {
        self.presenter?.editProfile()
    }
    
}

