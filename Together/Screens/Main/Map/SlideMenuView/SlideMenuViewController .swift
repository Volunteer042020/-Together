//
//  SlideMenuViewController .swift
//  Together
//
//  Created by Евгений Шварцкопф on 03.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

final class SlideMenuViewController: UIViewController {
    
    var presenter: SlideMenuViewAction?
    
    //MARK: - Private properties
    
    //вью просим отобразить контент
    private lazy var slideMenuView = view as? SlideMenuViewImpl
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = slideMenuView, let presenter = presenter {
            view.setPresenter(presenter)
        }
    }
}


extension SlideMenuViewController: SlideMenuViewControllerImpl {
    
}
