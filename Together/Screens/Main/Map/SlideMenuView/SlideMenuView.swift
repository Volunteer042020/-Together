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
    
    enum SlideUpViewState {
        case expanded
        case halfScreen
        case collapsed
    }
    
    var presenter: SlideMenuViewAction?
    
    //MARK: - Private properties
    private var viewState: SlideUpViewState = .collapsed
    
    private let expandedViewHeight: CGFloat = UIScreen.main.bounds.height - 80
    private let halfScreenViewHeight: CGFloat = UIScreen.main.bounds.height / 2
    private let collapsedViewHeight: CGFloat = 120
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Поиск"
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        return searchBar
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
    }
    
    
    @objc func panGesture() {
        
    }
    
    
    private func setupLineView() {
        self.addSubview(lineView)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    
    private func setupSearchBar() {
        self.addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
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


extension SlideMenuView: PresenterHaving {
    
    func setPresenter(_ presenter: ViewAstions) {
        if let presenter = presenter as? SlideMenuViewAction {
            self.presenter = presenter
        }
    }
}


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

