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

}

extension ProfileView: PresenterHaving {
    
    func setPresenter(_ presenter: ViewAstions) {
        if let presenter = presenter as? ProfileViewAction {
            self.presenter = presenter
        }
    }
}

extension ProfileView: ProfileViewImpl {
    
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

