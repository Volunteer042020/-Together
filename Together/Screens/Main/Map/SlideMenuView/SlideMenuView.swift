//
//  SlideMenuView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 03.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol SlideMenuViewImpl {
    func showCategories(_ categories: [Category])
    
}

final class SlideMenuView: ScrollableView {
    
    enum SlideUpViewState {
        case expanded
        case halfScreen
        case collapsed
    }
    
    var presenter: SlideMenuViewAction?
    
    //MARK: - Private properties
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lineNavView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Поиск"
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.setupFooter()
        return tableView
    }()
    
    private var tableViewProvider: SlideMenuTableViewProviderImpl?
    
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
        
        setupLineView()
        setupSearchBar()
        setupLineViewNav()
        setupTableView()
    }

    private func setupLineView() {
        self.addSubview(lineView)
        
        lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    
    private func setupSearchBar() {
        self.addSubview(searchBar)
        
        searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
    }
    
    private func setupLineViewNav() {
        self.addSubview(lineNavView)
        
        lineNavView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8).isActive = true
        lineNavView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lineNavView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lineNavView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func setupTableView() {
        self.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: lineNavView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        setupTableViewProvider()
        registerCells()
    }
    
    private func setupTableViewProvider() {
        let provider = SlideMenuTableViewProvider(tableView: tableView)
        self.tableViewProvider = provider
        
        tableView.delegate = provider
        tableView.dataSource = provider
    }
    
    private func registerCells() {
        tableView.register(SlideMenuCell.nib,
                           forCellReuseIdentifier: SlideMenuCell.reuseId)
    }
}


//MARK: - SlideMenuViewImpl
extension SlideMenuView: SlideMenuViewImpl {
    
    func showCategories(_ categories: [Category]) {
        tableViewProvider?.showContent(data: categories)
    }
}


//MARK: - PresenterHaving
extension SlideMenuView: PresenterHaving {
    
    func setPresenter(_ presenter: ViewAstions) {
        if let presenter = presenter as? SlideMenuViewAction {
            self.presenter = presenter
        }
    }
}


//MARK: - UISearchBarDelegate
extension SlideMenuView: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        searchBar.showsCancelButton = true
        
        if viewState == .collapsed || viewState == .halfScreen {
            animateView(toState: .expanded)
        }
        
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        if viewState == .expanded {
            animateView(toState: .collapsed)
        }
        
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
}

