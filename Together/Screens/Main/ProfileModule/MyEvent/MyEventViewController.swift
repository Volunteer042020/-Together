//
//  MyEventViewController.swift
//  Together
//
//  Created by Евгений Шварцкопф on 10.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


class MyEventViewController: UIViewController {
    
    //MARK: - Open properties
    var presenter: MyEventViewAction?
    
    
    //MARK: - Private properties
    private lazy var myEventView = view as? (MyEventViewImpl & PresenterHaving)
    
    
    //MARK: - Life cycle
    override func loadView() {
        view = MyEventView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = myEventView , let presenter = presenter {
            view.setPresenter(presenter)
        }
        
        setNavigation()
    }
    
    //MARK: - Private metods
    private func setNavigation() {
        navigationItem.title = "Мои просьбы"
        
        let backButton = UIBarButtonItem()
        backButton.title = "Профиль"
        backButton.tintColor = UIColor.customGray
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
}

extension MyEventViewController: MyEventViewControllerImpl {
    
}
