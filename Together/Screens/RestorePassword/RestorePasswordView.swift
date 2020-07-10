//
//  RestorePasswordView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 09.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol RestorePasswordViewImpl {
    //функции типа, покажи данные
    func setPresenter(_ presenter: RestorePasswordViewAction)
}


final class RestorePasswordView: UIView {
    
    //MARK: - Private properties
    private var presenter: RestorePasswordViewAction?
    
    private lazy var restoreStack: UIStackView = {
        let stack = VerticalStack()
        return stack
    }()
    
    private lazy var restoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Восстановления пароля"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var restoreTextField: UITextField = {
        let textField = GrayTextField()
        textField.placeholder = "Ваш E-mail"
        return textField
    }()
    
    private lazy var restoreLineView: UIView = {
        return GrayLineView()
    }()
    
    private lazy var restorePasswordButton: UIButton = {
        let button = RoundedButtonWithShadow(type: .system)
        button.backgroundColor = .greenButton
        button.setTitle("ВОССТАНОВИТЬ ПАРОЛЬ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "", size: 20)
        
        button.addTarget(self, action: #selector(restorePasswordAction), for: .touchUpInside)
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
        setupRestoreStack()
        setupRestorePasswordButton()
    }
    
    fileprivate func setupRestoreStack() {
        self.addSubview(restoreStack)
        
        restoreStack.addArrangedSubview(restoreLabel)
        restoreStack.addArrangedSubview(restoreTextField)
        restoreStack.addArrangedSubview(restoreLineView)
        
        restoreStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        restoreStack.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        restoreStack.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,
                                           constant: sideArchoreConctant).isActive = true
        restoreStack.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                            constant: -sideArchoreConctant).isActive = true
    }
    
    private func setupRestorePasswordButton() {
        
        self.addSubview(restorePasswordButton)
        
        restorePasswordButton.topAnchor.constraint(equalTo: restoreStack.bottomAnchor, constant: 50).isActive = true
        restorePasswordButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: sideArchoreConctant).isActive = true
        restorePasswordButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -sideArchoreConctant).isActive = true
        restorePasswordButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
}

extension RestorePasswordView: RestorePasswordViewImpl {
    
    func setPresenter(_ presenter: RestorePasswordViewAction) {
        self.presenter = presenter
    }
    
    @objc func restorePasswordAction(_ sender: UIButton) {
        print("Пароль удачно восстановлен")
    }
    
}
