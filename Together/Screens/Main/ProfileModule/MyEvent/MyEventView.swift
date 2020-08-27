//
//  MyEventView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 10.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol MyEventViewImpl {
    //функции типа, покажи данные
}


final class MyEventView: UIView {
    
    //MARK: - Open properties
    // для проверки, работоспособности кода
    var eventArray = [1,1,1]
    //  var eventArray: [Int] = []
    
    //MARK: - Private properties
    private var presenter: MyEventViewAction?
    private var checkEvent: Bool {
        get {
            return eventArray.count != 0 ? true : false
        }
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.systemGray5
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.setupFooter()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MyEventTableViewCell.nib, forCellReuseIdentifier: MyEventTableViewCell.reuseId)
        tableView.register(AddEventTableViewCell.nib, forCellReuseIdentifier: AddEventTableViewCell.reuseId)
        tableView.register(ProfileBetweenLineSectionTableViewCell.nib, forCellReuseIdentifier: ProfileBetweenLineSectionTableViewCell.reuseId)
        
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        tableView.backgroundColor = UIColor.systemGray5
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGray6
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageView.layer.shadowColor = UIColor.lightGray.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 3
        imageView.layer.masksToBounds = false
        
        imageView.image = UIImage(named: "logoEvent")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var myEventLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.customGray
        label.font = UIFont(name: "", size: 20)
        label.text = "У вас еще нет ни одной просьбы о помощи"
        label.numberOfLines = 2
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var greatMyEventButton: UIButton = {
        let button = RoundedButtonWithShadow(type: .system)
        
        button.setTitle("Cоздать просьбу", for: .normal)
        button.titleLabel?.font = UIFont(name: "", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .marineButton
        
        button.addTarget(self, action: #selector(greatMyEventAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
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
        checkEvent == true ? setupUIIsHaveEvent() : setupUIIfNotEvent()
    }
    
    private func setupUIIfNotEvent() {
        self.addSubview(scrollView)
        
        scrollView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        setupImageView()
        setupMyEventLabel()
        setupGreatMyEventButton()
    }
    
    private func setupUIIsHaveEvent() {
        self.addSubview(tableView)
        
        tableView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupImageView() {
        scrollView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -imageCenterYConstant).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
    }
    
    private func setupMyEventLabel() {
        scrollView.addSubview(myEventLabel)
        
        myEventLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: eventTopConstant).isActive = true
        myEventLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: labelRightAndLeftConstant).isActive = true
        myEventLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -labelRightAndLeftConstant).isActive = true
    }
    
    private func setupGreatMyEventButton() {
        scrollView.addSubview(greatMyEventButton)
        
        greatMyEventButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        greatMyEventButton.topAnchor.constraint(equalTo: myEventLabel.bottomAnchor, constant: buttonTopConstant).isActive = true
        greatMyEventButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: sideArchoreConctant).isActive = true
        greatMyEventButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -sideArchoreConctant).isActive = true
        greatMyEventButton.bottomAnchor.constraint(equalToSystemSpacingBelow: scrollView.bottomAnchor, multiplier: 0).isActive = true
        
        greatMyEventButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
    }
    
}

extension MyEventView: PresenterHaving {
    
    func setPresenter(_ presenter: ViewAstions) {
        if let presenter = presenter as? MyEventViewAction {
            self.presenter = presenter
        }
    }
}

extension MyEventView: MyEventViewImpl {
    
    @objc func greatMyEventAction(_ sender: UIButton) {
        print("Создаю просьбу")
    }
}

//MARK: - Size properties
extension MyEventView {
    
    private var buttonTopConstant: CGFloat { return 230.0 }
    private var buttonHeight: CGFloat { return 40.0 }
    
    private var eventTopConstant: CGFloat { return 10.0 }
    private var labelRightAndLeftConstant: CGFloat { return 100.0 }
    
    private var imageCenterYConstant: CGFloat { return 50.0 }
    private var imageHeight: CGFloat { return 150.0 }
    private var imageWidth: CGFloat { return 220.0 }
    
}

// MARK: - MyEventView: Delegate
extension MyEventView: UITableViewDelegate {
    
}

//MARK: - MyEventView: DataSource
extension MyEventView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventArray.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lastIndexes = eventArray.count + 1
        
        if indexPath.row == lastIndexes - 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBetweenLineSectionTableViewCell.reuseId,
                                                           for: indexPath) as? ProfileBetweenLineSectionTableViewCell else {
                                                            return UITableViewCell()
            }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        } else if indexPath.row == lastIndexes {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddEventTableViewCell.reuseId,
                                                           for: indexPath) as? AddEventTableViewCell else {
                                                            return UITableViewCell()
            }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.addEventButton.addTarget(self, action: #selector(greatMyEventAction), for: .touchUpInside)
            return cell
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyEventTableViewCell.reuseId,
                                                           for: indexPath) as? MyEventTableViewCell else {
                                                            return UITableViewCell()
            }
            cell.modal(indexPath: indexPath, lastIndex: lastIndexes)
            return cell
        }
    }
}
