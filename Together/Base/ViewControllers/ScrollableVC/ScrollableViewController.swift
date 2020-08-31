//
//  ScrollableViewController.swift
//  Together
//
//  Created by Anastasia Reyngardt on 31.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


class ScrollableViewController: UIViewController {
    
    //MARK: - Life cycle
      override func loadView() {
          view = ScrollableView(frame: UIScreen.main.bounds)
      }
}
