//
//  ProfileView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 15.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ProfileViewImpl {
    //функции типа, покажи данные
}

final class ProfileView: UIView {
    
    //MARK: - Private properties
    private var presenter: ProfileViewAction?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.systemGray5
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        
        tableView.register(ProfileMainTableViewCell.nib,
                           forCellReuseIdentifier: ProfileMainTableViewCell.reuseId)
        tableView.register(ProfileEventTapTableViewCell.nib,
                           forCellReuseIdentifier: ProfileEventTapTableViewCell.reuseId)
        tableView.register(ProfileBetweenLineSectionTableViewCell.nib,
                           forCellReuseIdentifier: ProfileBetweenLineSectionTableViewCell.reuseId)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
    }
    
    private func setupTableView() {
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.settingFooter()
    }
    
//    private let scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private lazy var loginStack: UIStackView = {
//        let stack = VerticalStack()
//        return stack
//    }()
//
//    lazy var nameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Имя"
//        return label
//    }()
//
//    lazy var nameUser: UILabel = {
//        let label = UILabel()
//        label.text = "Не указано"
//        label.textColor = .lightGray
//        return label
//    }()
//
//    lazy var lastNameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Фамилия"
//        return label
//    }()
//
//    lazy var lastNameUser: UILabel = {
//        let label = UILabel()
//        label.text = "Не указано"
//        label.textColor = .lightGray
//        return label
//    }()
//
//    lazy var emailLabel: UILabel = {
//        let label = UILabel()
//        label.text = "E-mail"
//        return label
//    }()
//
//    lazy var emailUser: UILabel = {
//        let label = UILabel()
//        label.text = "Не указан"
//        label.textColor = .lightGray
//        return label
//    }()
//
//    lazy var phoneLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Телефон"
//        return label
//    }()
//
//    lazy var phoneUser: UILabel = {
//        let label = UILabel()
//        label.text = "Не указан"
//        label.textColor = .lightGray
//        return label
//    }()
//
//    lazy var aboutLabel: UILabel = {
//        let label = UILabel()
//        label.text = "О себе"
//        return label
//    }()
//
//    lazy var aboutUser: UILabel = {
//        let label = UILabel()
//        label.text = "Не указано"
//        label.textColor = .lightGray
//        label.numberOfLines = 0
//        return label
//    }()
//
//    lazy var actionEventButton: UIButton = {
//        let button = RoundedButtonWithShadow(type: .system)
//        button.setTitle("АКТИВНЫЕ МЕРОПРИЯТИЯ", for: .normal)
//        button.titleLabel?.font = UIFont(name: "", size: 20)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .marineButton
//
//        button.addTarget(self, action: #selector(actionEventPresent), for: .touchUpInside)
//        return button
//    }()
//
//    lazy var myEventButton: UIButton = {
//        let button = RoundedButtonWithShadow(type: .system)
//        button.setTitle("ВЫПОЛНЕННЫЕ МЕРОПРИЯТИЯ", for: .normal)
//        button.titleLabel?.font = UIFont(name: "", size: 20)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .marineButton
//
//        button.addTarget(self, action: #selector(completionEventPresent), for: .touchUpInside)
//        return button
//    }()
//
//    lazy var quitProfileButton: UIButton = {
//        let button = RoundedButtonWithShadow(type: .system)
//        button.setTitle("ВЫЙТИ", for: .normal)
//        button.titleLabel?.font = UIFont(name: "", size: 20)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .redButton
//
//        button.addTarget(self, action: #selector(quitProfileAction), for: .touchUpInside)
//        return button
//    }()
//
//    //MARK: - Init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupUI()
//    }
//
//    private func setupUI() {
//        setupScrollView()
//        setupProfileStack()
//        setupActionEventButton()
//        setupMyEventButton()
//        setupQuitProfileButton()
//    }
//
//    private func setupScrollView() {
//        self.addSubview(scrollView)
//
//        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
//                                        constant: 0).isActive = true
//        scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,
//                                         constant: 0).isActive = true
//        scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
//                                          constant: 0).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
//    }
//
//    fileprivate func setupProfileStack() {
//        scrollView.addSubview(loginStack)
//
//        loginStack.addArrangedSubview(nameLabel)
//        loginStack.addArrangedSubview(nameUser)
//        loginStack.addArrangedSubview(lastNameLabel)
//        loginStack.addArrangedSubview(lastNameUser)
//        loginStack.addArrangedSubview(emailLabel)
//        loginStack.addArrangedSubview(emailUser)
//        loginStack.addArrangedSubview(phoneLabel)
//        loginStack.addArrangedSubview(phoneUser)
//        loginStack.addArrangedSubview(aboutLabel)
//        loginStack.addArrangedSubview(aboutUser)
//
//        loginStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
//        loginStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
//        loginStack.leftAnchor.constraint(equalTo: scrollView.leftAnchor,
//                                         constant: sideArchoreConctant).isActive = true
//        loginStack.rightAnchor.constraint(equalTo: scrollView.rightAnchor,
//                                          constant: -sideArchoreConctant).isActive = true
//    }
//
//    private func setupActionEventButton() {
//        scrollView.addSubview(actionEventButton)
//
//        actionEventButton.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 40).isActive = true
//        actionEventButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: sideArchoreConctant).isActive = true
//        actionEventButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -sideArchoreConctant).isActive = true
//        actionEventButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//    }
//
//    private func setupMyEventButton() {
//        scrollView.addSubview(myEventButton)
//
//        myEventButton.topAnchor.constraint(equalTo: actionEventButton.bottomAnchor, constant: 20).isActive = true
//        myEventButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: sideArchoreConctant).isActive = true
//        myEventButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -sideArchoreConctant).isActive = true
//        myEventButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//    }
//
//    private func setupQuitProfileButton() {
//        scrollView.addSubview(quitProfileButton)
//
//        quitProfileButton.topAnchor.constraint(equalTo: myEventButton.bottomAnchor, constant: 20).isActive = true
//        quitProfileButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: sideArchoreConctant).isActive = true
//        quitProfileButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -sideArchoreConctant).isActive = true
//        quitProfileButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        quitProfileButton.bottomAnchor.constraint(equalToSystemSpacingBelow: scrollView.bottomAnchor, multiplier: 0).isActive = true
//    }
}

extension ProfileView: PresenterHaving {
    
    func setPresenter(_ presenter: ViewAstions) {
        if let presenter = presenter as? ProfileViewAction {
            self.presenter = presenter
        }
    }
}

extension ProfileView: ProfileViewImpl {
    
//    @objc func actionEventPresent(_ sender: UIButton) {
//        self.presenter?.showActionEvent()
//        print("Показываю мероприятия на которые пользователь подписался")
//    }
//
//    @objc func completionEventPresent(_ sender: UIButton) {
//        self.presenter?.showCompletionEvent()
//        print("Показываю выполненые мероприятия данного пользователя")
//    }
    
//    @objc func quitProfileAction(_ sender: UIButton) {
//        self.presenter?.showAlert()
//        print("Показываю алерт для потверждения выхода")
//    }
    
    @objc func showProfileSetting(_ sender: UIButton) {
        self.presenter?.getProfileSettingView()
    }
}

// MARK: - Delegate
extension ProfileView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            self.presenter?.showActionEvent()
        } else if indexPath.row == 3 {
            self.presenter?.showCompletionEvent()
        } else if indexPath.row == 5 {
            self.presenter?.showMyEvent()
            print("show My Event")
        }
    }
    
}

// MARK: - DataSource
extension ProfileView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // выставляем высоту для каждой ячейки
        if indexPath.row == 0 {
            return 200
        } else if indexPath.row == 1 {
            return 20
        } else if indexPath.row == 2 || indexPath.row == 3 {
            return 50
        } else if indexPath.row == 4 {
            return 20
        } else if indexPath.row == 5 {
            return 50
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // прописываем каждую ячейку, чтоб все находилось на своих местах
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMainTableViewCell.reuseId, for: indexPath) as? ProfileMainTableViewCell else { return UITableViewCell() }
            cell.modal()
            // насчет реализации кнопки в сомнениях, но пока только такой вариант пришел в голову
            cell.settingProfileButton.addTarget(self, action: #selector(showProfileSetting), for: .touchDown)
            // TO DO ... надо подумать, как вынести это свойство, чтоб не повторять его
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBetweenLineSectionTableViewCell.reuseId, for: indexPath) as? ProfileBetweenLineSectionTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileEventTapTableViewCell.reuseId, for: indexPath) as? ProfileEventTapTableViewCell else { return UITableViewCell() }
            cell.nameEvent.text = "Активные просьбы"
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileEventTapTableViewCell.reuseId, for: indexPath) as? ProfileEventTapTableViewCell else { return UITableViewCell() }
            cell.nameEvent.text = "Выполненые просьбы"
            cell.liveView.isHidden = true
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else if indexPath.row == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBetweenLineSectionTableViewCell.reuseId, for: indexPath) as? ProfileBetweenLineSectionTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileEventTapTableViewCell.reuseId, for: indexPath) as? ProfileEventTapTableViewCell else { return UITableViewCell() }
            cell.nameEvent.text = "Мои просьбы"
            cell.liveView.isHidden = true
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
    }
}

