//
//  UIViewController+Extension.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/06.
//

import Foundation
import UIKit

extension UITextField {
    
    func addLeftPadding() {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always   
    }
    
    func textFieldConfig(placeholder: String, passwordOrNot: Bool) {
        
        self.placeholder = placeholder
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 5
        self.isSecureTextEntry = passwordOrNot
        self.addLeftPadding()
    }
}
