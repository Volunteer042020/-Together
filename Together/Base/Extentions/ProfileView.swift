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
    func setPresenter(_ presenter: ProfileViewAction)
}


final class ProfileView: UIView {
    
    //MARK: - Private properties
    private var presenter: ProfileViewAction?
    
  
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
    }
    
    
}

extension ProfileView: ProfileViewImpl {
    
    func setPresenter(_ presenter: ProfileViewAction) {
        self.presenter = presenter
    }    
}
