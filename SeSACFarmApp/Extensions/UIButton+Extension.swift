//
//  UIButton+Extension.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/12.
//

import Foundation
import UIKit

extension UIButton {
    
    func buttonConfig(title: String) {
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .systemGreen
        self.layer.cornerRadius = 5
    }
}
