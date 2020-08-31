//
//  SlideMenuViewController .swift
//  Together
//
//  Created by Евгений Шварцкопф on 03.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

final class SlideMenuViewController: ScrollableViewController {
    
    var presenter: SlideMenuViewAction?
    
    //MARK: - Private properties
    private lazy var slideMenuView = view as? (SlideMenuViewImpl & PresenterHaving)
    
     //MARK: - Life cycle
    override func loadView() {
        view = SlideMenuView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if let presenter = presenter {
            slideMenuView?.setPresenter(presenter)
            presenter.viewDidLoad()
        }
    }
}


 //MARK: - SlideMenuViewControllerImpl
extension SlideMenuViewController: SlideMenuViewControllerImpl {
    
    func showCategories(_ categories: [Category]) {
        slideMenuView?.showCategories(categories)
    }
    
    
}
