//
//  RegisterView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 08.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


protocol RegisterAccountViewImpl {
    //функции типа, покажи данные
    func setPresenter(_ presenter: RegisterAccountViewAction)
}


final class RegisterAccountView: UIView {
    
    //MARK: - Private properties
    
    private var presenter: RegisterAccountViewAction?
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginStack: UIStackView = {
        let stack = VerticalStack()
        return stack
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        return GrayTextField()
    }()
    
    private lazy var emailLine: UIView = {
        let view = GrayLineView()
        return view
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Телефон"
        return label
    }()
    
    private lazy var numberTextField: UITextField = {
      return GrayTextField()
    }()
    
    private lazy var numberLine: UIView = {
        let view = GrayLineView()
        return view
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        return GrayTextField()
    }()
    
    private lazy var passwordLine: UIView = {
        return GrayLineView()
    }()
    
    private lazy var repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Потверждения пароля"
        return label
    }()
    
    private lazy var repeatPasswordTextField: UITextField = {
        return GrayTextField()
    }()
    
    private lazy var repeatPasswordLine: UIView = {
        return GrayLineView()
    }()
    
    private lazy var checkmarkButton: UIButton = {
        let button = RoundedButtonWithShadow()
        button.backgroundColor = .white
        button.isSelected = false
        button.addTarget(self, action: #selector(checkmarkAction), for: .touchUpInside)
        button.addTarget(self, action: #selector(checkmarkColor), for: .touchDown)
        return button
    }()
    
    private lazy var checkmarkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .customGray
        label.text = "Соглашение с политикой конфиденциальности"
        return label
    }()
    
    private lazy var registerButton: UIButton = {
        let button = RoundedButtonWithShadow(type: .system)
        button.backgroundColor = .greenButton
        button.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "", size: 20)
        
        button.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
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
        setupScrollView()
        setupLoginStack()
        setupCheckmarkButtonAndCheckmarkLabel()
        setupRegisterButton()
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
    
    fileprivate func setupLoginStack() {
        scrollView.addSubview(loginStack)
        
        loginStack.addArrangedSubview(emailLabel)
        loginStack.addArrangedSubview(emailTextField)
        loginStack.addArrangedSubview(emailLine)
        loginStack.addArrangedSubview(numberLabel)
        loginStack.addArrangedSubview(numberTextField)
        loginStack.addArrangedSubview(numberLine)
        loginStack.addArrangedSubview(passwordLabel)
        loginStack.addArrangedSubview(passwordTextField)
        loginStack.addArrangedSubview(passwordLine)
        loginStack.addArrangedSubview(repeatPasswordLabel)
        loginStack.addArrangedSubview(repeatPasswordTextField)
        loginStack.addArrangedSubview(repeatPasswordLine)
        
        loginStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80).isActive = true
        loginStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        loginStack.leftAnchor.constraint(equalTo: scrollView.leftAnchor,
                                         constant: sideArchoreConctant).isActive = true
        loginStack.rightAnchor.constraint(equalTo: scrollView.rightAnchor,
                                          constant: -sideArchoreConctant).isActive = true
    }
    
    private func setupCheckmarkButtonAndCheckmarkLabel() {
        // checkmarkButton anchor
        scrollView.addSubview(checkmarkButton)
        
        checkmarkButton.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 50).isActive = true
        checkmarkButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: sideArchoreConctant).isActive = true
        checkmarkButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        checkmarkButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        scrollView.addSubview(checkmarkLabel)
        //checkmarkLabel anchor
        checkmarkLabel.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 50).isActive = true
        checkmarkLabel.leftAnchor.constraint(equalTo: checkmarkButton.rightAnchor, constant: 10).isActive = true
        checkmarkLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50).isActive = true
        checkmarkLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupRegisterButton() {
        scrollView.addSubview(registerButton)
        
        registerButton.topAnchor.constraint(equalTo: checkmarkLabel.bottomAnchor, constant: 98).isActive = true
        registerButton.bottomAnchor.constraint(equalToSystemSpacingBelow: scrollView.bottomAnchor, multiplier: 0).isActive = true
        registerButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: sideArchoreConctant).isActive = true
        registerButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -sideArchoreConctant).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

extension RegisterAccountView: RegisterAccountViewImpl {
    
    func setPresenter(_ presenter: RegisterAccountViewAction) {
        self.presenter = presenter
    }
    
    @objc func registerAction(_ sender: UIButton) {
        print("Аккаунт удачно зарегестирован")
    }
        
    // для плавного изменения цвета
    
    @objc private func checkmarkColor(_ sender: UIButton) {
        sender.backgroundColor = .blueButton
    }
    
    // Кнопка для подтверждения конфиденциальности
    
    @objc func checkmarkAction(_ sender: UIButton) {
        if sender.isSelected != true {
            checkmarkButton.setImage(UIImage(systemName: "checkmark"), for: .selected)
            checkmarkButton.backgroundColor = .blueButton
            checkmarkButton.tintColor = .white
            checkmarkButton.layer.cornerRadius = 10
            sender.isSelected = true
        } else {
            checkmarkButton.backgroundColor = .white
            checkmarkButton.layer.cornerRadius = 10
            sender.isSelected = false
        }
    }
}


//MARK: - Size constant
//extension RegisterAccountView {
//    
//    private var sideArchoreConctant: CGFloat {
//        return 20
//    }
//}
