//
//  ChangePasswordViewController.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/12.
//

import Foundation
import UIKit

class ChangePasswordViewController: UIViewController {
    
    let mainView = ChangePasswordView()
    let viewModel = MainBoardViewModel()
    
    override func loadView() {
        
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        mainView.changeButton.addTarget(self, action: #selector(changeButtonClicked), for: .touchUpInside)
        
        navigationItemConfig()
    }
    
    func navigationItemConfig() {
        
        navigationItem.title = "비밀번호 변경"
        navigationItem.leftBarButtonItem = mainView.backBarButton
        
        mainView.backBarButton.target = self
        mainView.backBarButton.action = #selector(backBarButtonClicked)
    }
    
    @objc func changeButtonClicked() {
        
        let currentPassword = mainView.currentPasswordTextField.text ?? ""
        let newPassword = mainView.newPasswordTextField.text ?? ""
        let confirmPassword = mainView.confirmTextField.text ?? ""
        
        guard currentPassword != "" else {
            showToast(vc: self, message: "현재 비밀번호를 입력해주세요")
            return
        }
        guard newPassword != "" else {
            showToast(vc: self, message: "새 비밀번호를 입력해주세요")
            return
        }
        guard confirmPassword != "" else {
            showToast(vc: self, message: "새 비밀번호 확인을 입력해주세요")
            return
        }
        viewModel.changePassword(currentPassword: currentPassword, newPassword: newPassword, confirmPassword: confirmPassword) { error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    switch error {
                    case .identifierOrPasswordFailed:
                        showToast(vc: self, message: "현재 비밀번호와 새로운 비밀번호를 확인해주세요", font: .systemFont(ofSize: 15))
                    case .invalidToken:
                        showToast(vc: self, message: "토큰이 만료되었습니다")
                    default: showToast(vc: self, message: "변경 실패")
                    }
                    return
                }
                let vc = MainBoardViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true) {
                    showToast(vc: nav, message: "변경 성공!")
                }
            }
        }
    }
    
    @objc func backBarButtonClicked() {
        
        self.dismiss(animated: true, completion: nil)
    }
}
