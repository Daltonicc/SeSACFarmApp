//
//  UIViewController+Extensions.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/13.
//

import Foundation
import UIKit

extension UIViewController {
    
    func invalidTokenAlert() {
        
        let alert = UIAlertController(title: "토큰이 만료되었습니다!", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { action in
            
            let vc = LoginViewController()
            vc.mainView.backBarButton.isEnabled = false
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
    func warningAlert(handler: @escaping (UIAlertAction) -> Void) {
        
        let alert = UIAlertController(title: "정말 삭제하시겠습니까?",message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "확인", style: .default, handler: handler)
        
        cancel.setValue(UIColor.red, forKey: "titleTextColor")
        
        alert.addAction(ok)
        alert.addAction(cancel)
  
        present(alert, animated: true, completion: nil)
    }
    
    func customPushViewController(pushVC: UIViewController) {
        
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    func customPresentViewController(presentVC: UIViewController, completion: (() -> Void)?) {
        
        let nav = UINavigationController(rootViewController: presentVC)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: completion)
    }
}
