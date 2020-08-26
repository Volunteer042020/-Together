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
}


final class ProfileSettingView: UIView {
    
    //MARK: - Private properties
    private var presenter: ProfileSettingViewAction?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.systemGray5
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        
        tableView.register(ProfileSettingMainTableViewCell.nib,
                           forCellReuseIdentifier: ProfileSettingMainTableViewCell.reuseId)
        tableView.register(ProfileSettingEmailAndPhoneTableViewCell.nib,
                           forCellReuseIdentifier: ProfileSettingEmailAndPhoneTableViewCell.reuseId)
        tableView.register(ProfileBetweenLineSectionTableViewCell.nib,
                           forCellReuseIdentifier: ProfileBetweenLineSectionTableViewCell.reuseId)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var newSettingButton: UIButton = {
        let button = RoundedButtonWithShadow(type: .system)
        button.setTitle("Сохранить изменения", for: .normal)
        button.titleLabel?.font = UIFont(name: "", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .marineButton
        
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    
    lazy var quitProfileButton: UIButton = {
        let button = RoundedButtonWithShadow(type: .system)
        button.setTitle("Выйти", for: .normal)
        button.titleLabel?.font = UIFont(name: "", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .redButton
        
        button.addTarget(self, action: #selector(quitProfileAction), for: .touchUpInside)
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
        self.backgroundColor = UIColor.systemGray5
        setupTableView()
        setupNewSettingButton()
        setupQuitProfileButton()
    }
    
    private func setupTableView() {
        self.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        tableView.settingFooter()
    }
    
    private func setupNewSettingButton() {
        tableView.addSubview(newSettingButton)
        
        newSettingButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        newSettingButton.centerYAnchor.constraint(equalTo: tableView.centerYAnchor, constant: roundButtonTopAnchor).isActive = true
        newSettingButton.leftAnchor.constraint(equalTo: tableView.leftAnchor, constant: sideArchoreConctant).isActive = true
        newSettingButton.rightAnchor.constraint(equalTo: tableView.rightAnchor, constant: -sideArchoreConctant).isActive = true
        newSettingButton.heightAnchor.constraint(equalToConstant: roundButtonHeight).isActive = true
    }
    
    private func setupQuitProfileButton() {
        tableView.addSubview(quitProfileButton)
        
        quitProfileButton.topAnchor.constraint(equalTo: newSettingButton.bottomAnchor, constant: roundButtonBetweenOfButton).isActive = true
        quitProfileButton.leftAnchor.constraint(equalTo: tableView.leftAnchor, constant: sideArchoreConctant).isActive = true
        quitProfileButton.rightAnchor.constraint(equalTo: tableView.rightAnchor, constant: -sideArchoreConctant).isActive = true
        quitProfileButton.bottomAnchor.constraint(equalToSystemSpacingBelow: tableView.bottomAnchor, multiplier: 0).isActive = true
        
        quitProfileButton.heightAnchor.constraint(equalToConstant: roundButtonHeight).isActive = true
    }
}

extension ProfileSettingView: PresenterHaving {
    
    func setPresenter(_ presenter: ViewAstions) {
        if let presenter = presenter as? ProfileSettingViewAction {
            self.presenter = presenter
        }
    }
}

extension ProfileSettingView: ProfileSettingViewImpl {
    
    @objc func showAlert(_: UIButton) {
        self.presenter?.editProfile()
    }
    
    @objc func quitProfileAction(_ sender: UIButton) {
        self.presenter?.showAlert()
        print("Показываю алерт для потверждения выхода")
    }
    
}

extension ProfileSettingView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // MARK: - TO DO ... fix me
        if indexPath.row == 3 {
            print("Пытаюсь изменить номер телефона")
        } else if indexPath.row == 4 {
            print("Пытаюсь изменить почту")
        }
    }
    
}

extension ProfileSettingView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // выставляем высоту для каждой ячейки
        if indexPath.row == 0 || indexPath.row == 1 {
            return 80
        } else if indexPath.row == 2 {
            return 20
        } else if indexPath.row == 3 || indexPath.row == 4 {
            return 50
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 || indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileSettingMainTableViewCell.reuseId, for: indexPath) as? ProfileSettingMainTableViewCell else { return UITableViewCell() }
            cell.modal(indexPath: indexPath)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBetweenLineSectionTableViewCell.reuseId, for: indexPath) as? ProfileBetweenLineSectionTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileSettingEmailAndPhoneTableViewCell.reuseId, for: indexPath) as? ProfileSettingEmailAndPhoneTableViewCell else { return UITableViewCell() }
            cell.modal(indexPath: indexPath)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileSettingEmailAndPhoneTableViewCell.reuseId, for: indexPath) as? ProfileSettingEmailAndPhoneTableViewCell else { return UITableViewCell() }
            cell.modal(indexPath: indexPath)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        }
    }
}

//MARK: - Size properties
extension ProfileSettingView {
    
    private var roundButtonHeight: CGFloat { return 40.0 }
    private var roundButtonTopAnchor: CGFloat { return 280.0 }
    private var roundButtonBetweenOfButton: CGFloat { return 10.0 }
    
}
