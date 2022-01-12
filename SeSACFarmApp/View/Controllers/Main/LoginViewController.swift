//
//  LoginViewController.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/02.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let mainView = LoginView()
    let viewModel = LoginViewModel()
    
    override func loadView() {
        
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItemConfig()
        textFieldConfig()
        
    }
    
    func navigationItemConfig() {
        
        navigationItem.title = "새싹농장 로그인"
        navigationItem.leftBarButtonItem = mainView.backBarButton
        
        // 바버튼은 바로 addTarget해줄 수 없음. 쪼개줘야함.
        mainView.backBarButton.target = self
        mainView.backBarButton.action = #selector(backBarButtonClicked)
    }
    
    func textFieldConfig() {
        
        viewModel.email.bind { text in
    
            self.mainView.emailTextField.text = text
            // 올바른 이메일 형식
        }
        
        viewModel.password.bind { text in
            
            self.mainView.passwordTextField.text = text
        }
        
        mainView.emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(textField:)), for: .editingChanged)
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(textField:)), for: .editingChanged)
        mainView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func emailTextFieldDidChange(textField: UITextField) {
        
        viewModel.email.value = textField.text ?? ""
    }
    
    @objc func passwordTextFieldDidChange(textField: UITextField) {
        
        viewModel.password.value = textField.text ?? ""
    }
    
    @objc func loginButtonClicked() {
        
        guard mainView.emailTextField.text != "" else {
            showToast(vc: self, message: "이메일을 입력해주세요")
            return
        }
        guard mainView.passwordTextField.text != "" else {
            showToast(vc: self, message: "비밀번호를 입력해주세요")
            return
        }
        viewModel.postUserLogin { error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    switch error {
                    case .identifierOrPasswordFailed:
                        showToast(vc: self, message: "이메일이나 비밀번호를 확인해주세요", font: .systemFont(ofSize: 15))
                    default: print("default")
                    }
                    return
                }
                let vc = MainBoardViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    @objc func backBarButtonClicked() {
        
        self.dismiss(animated: true, completion: nil)
    }
}
