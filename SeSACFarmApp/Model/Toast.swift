//
//  Toast.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/06.
//

import Foundation
import UIKit

func showToast(vc: UIViewController ,message : String, font: UIFont = UIFont.systemFont(ofSize: 17.0)) {

    let toastLabel = UILabel(frame: CGRect(x: vc.view.frame.size.width/2 - 100, y: vc.view.frame.size.height - 100, width: 200, height: 50))
    toastLabel.backgroundColor = UIColor.black
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds = true
    toastLabel.numberOfLines = 0
    vc.view.addSubview(toastLabel)
    UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0
        
    }, completion: {(isCompleted) in
        
        toastLabel.removeFromSuperview() })
    
}
