//
//  SignUpViewController.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/02.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    let mainView = SignUpView()
    let viewModel = SignUpViewModel()
    
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
        
        navigationItem.title = "새싹농장 가입하기"
        navigationItem.leftBarButtonItem = mainView.backBarButton
        
        // 바버튼은 바로 addTarget해줄 수 없음. 쪼개줘야함.
        mainView.backBarButton.target = self
        mainView.backBarButton.action = #selector(backBarButtonClicked)
    }
    
    func textFieldConfig() {
        
        viewModel.email.bind { text in
    
            self.mainView.emailTextField.text = text
        }
        
        viewModel.username.bind { text in
            
            self.mainView.nicknameTextField.text = text
        }
    
        viewModel.password.bind { text in
            self.mainView.passwordTextField.text = text
        }
        
        mainView.emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(textField:)), for: .editingChanged)
        mainView.nicknameTextField.addTarget(self, action: #selector(nicknameTextFieldDidChange(textField:)), for: .editingChanged)
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(textField:)), for: .editingChanged)
        mainView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func emailTextFieldDidChange(textField: UITextField) {
        
        viewModel.email.value = textField.text ?? ""
    }
    
    @objc func nicknameTextFieldDidChange(textField: UITextField) {
        
        viewModel.username.value = textField.text ?? ""
    }

    @objc func passwordTextFieldDidChange(textField: UITextField) {
        
        viewModel.password.value = textField.text ?? ""
    }
    
    @objc func signUpButtonClicked() {
        
        guard mainView.emailTextField.text != "" else {
            showToast(vc: self, message: "이메일을 입력해주세요")
            return
        }
        
        guard mainView.nicknameTextField.text != "" else {
            showToast(vc: self, message: "닉네임을 입력해주세요")
            return
        }
        
        guard mainView.passwordTextField.text != "" else {
            showToast(vc: self, message: "비밀번호를 입력해주세요")
            return
        }
        
        guard mainView.passwordTextField.text == mainView.doubleCheckTextField.text else {
            showToast(vc: self, message: "비밀번호가 서로 일치하지 않습니다")
            return
        }
    
        viewModel.postUserSignUp { error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    switch error {
                    case .identifierOrPasswordFailed:
                        showToast(vc: self, message: "이메일이나 비밀번호를 확인해주세요", font: .systemFont(ofSize: 15))
                    default: showToast(vc: self, message: "회원가입 실패")
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
        
        navigationController?.popViewController(animated: true)
    }
    
}
