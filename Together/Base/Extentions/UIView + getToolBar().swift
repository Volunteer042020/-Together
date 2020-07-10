//
//  UIView + getToolBar().swift
//  Together
//
//  Created by Евгений Шварцкопф on 09.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: расширения для скрывания клавиатуры
    func getToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(hideKeyboard))
        doneButton.tintColor = UIColor.customGray
        toolBar.setItems([doneButton], animated: false)
        return toolBar
    }
    
    @objc func hideKeyboard(){
        self.endEditing(true)
    }
}

// MARK: - Size constant

extension UIView {
    
    var sideArchoreConctant: CGFloat {
        return 20
    }
    
}
