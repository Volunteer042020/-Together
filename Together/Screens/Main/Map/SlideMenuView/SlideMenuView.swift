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

final class SlideMenuView: UIView {
    
    enum SlideUpViewState {
        case expanded
        case halfScreen
        case collapsed
    }
    
    var presenter: SlideMenuViewAction?
    
    //MARK: - Private properties
    
    private var viewState: SlideUpViewState = .collapsed
    
    private let expandedViewHeight: CGFloat = UIScreen.main.bounds.height - 200
    private let halfScreenViewHeight: CGFloat = UIScreen.main.bounds.height / 2
    private let collapsedViewHeight: CGFloat = 150
    
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
        
        self.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - collapsedViewHeight, width: UIScreen.main.bounds.width, height: collapsedViewHeight)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.clipsToBounds = true
        
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 2
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
        
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGesture))
        self.addGestureRecognizer(gesture)
        
        setupLineView()
        setupSearchBar()
        setupLineViewNav()
        setupTableView()
    }
    
    private func moveView(state: SlideUpViewState) {
        let yPosition = state == .collapsed ? collapsedViewHeight : expandedViewHeight
        self.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - yPosition, width: self.frame.width, height: self.frame.height)
    }
    
    private func moveView(panGestureRecognizer recognizer: UIPanGestureRecognizer) {
        let transtion = recognizer.translation(in: self)
        let minY = self.frame.minY
        
        if(minY + transtion.y >= collapsedViewHeight) && (minY + transtion.y <= expandedViewHeight) {
            let height = UIScreen.main.bounds.height - self.collapsedViewHeight
            self.frame = CGRect(x: 0, y: minY + transtion.y, width: self.frame.width, height: height)
            recognizer.setTranslation(CGPoint.zero, in: self)
        }
    }
    
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer) {
        moveView(panGestureRecognizer: recognizer)
        
        if recognizer.state == .ended {
            UIView.animate(withDuration: 0.6, delay: 0.0, options: [.allowUserInteraction], animations: {
                let state: SlideUpViewState = recognizer.velocity(in: self).y >= 0 ? .collapsed : .expanded
                self.moveView(state: state)
            }, completion: nil)
        }
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
        print(SlideMenuCell.nib)
        print(SlideMenuCell.reuseId)
        tableView.register(SlideMenuCell.nib,
                           forCellReuseIdentifier: SlideMenuCell.reuseId)
    }
    
    
    private func animateView(toState state: SlideUpViewState) {
        switch state {
        case .collapsed:
            UIView.animate(withDuration: 0.9,
                           delay: 0,
                           usingSpringWithDamping: 1.0,
                           initialSpringVelocity: 1.0,
                           animations: {
                            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.collapsedViewHeight, width: UIScreen.main.bounds.width, height: self.collapsedViewHeight)
            },
                           completion: { _ in
                            self.viewState = .collapsed
            })
        case .expanded:
            UIView.animate(withDuration: 0.9,
                           delay: 0,
                           usingSpringWithDamping: 1.0,
                           initialSpringVelocity: 1.0,
                           animations: {
                            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.expandedViewHeight, width: UIScreen.main.bounds.width, height: self.expandedViewHeight)
            },
                           completion: { _ in
                            self.viewState = .expanded
                           })
        case .halfScreen:
            break
        }
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

