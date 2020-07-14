//
//  UIViewController + indicator + basicAlert.swift
//  Together
//
//  Created by Евгений Шварцкопф on 09.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - индекатор загрузки, отображения загрузки на экране
    
    func runActivityIndicator(){
        let indicatorView = UIActivityIndicatorView()
        indicatorView.startAnimating()
        indicatorView.style = .large
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.tag = 420
        self.view.addSubview(indicatorView)
        indicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.view.isUserInteractionEnabled = false
    }
    
    func stopActivityIndicator(){
        if let subViews = self.view.viewWithTag(420) {
            subViews.removeFromSuperview()
            self.view.isUserInteractionEnabled = true
        }
    }
    
    // MARK: - общий alert для отображения информации гостю
    
    func showBasicAlert(_ title: String,_ message: String?,_ url: URL?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (alert) in
            if let urls = url {
                UIApplication.shared.open(urls, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
