//
//  SignUpView.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/02.
//

import Foundation
import UIKit
import SnapKit

class SignUpView: UIView {
    
    let backBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "arrow.left")
        barButton.tintColor = .black
        return barButton
    }()
    let emailTextField = UITextField()
    let nicknameTextField = UITextField()
    let passwordTextField = UITextField()
    let doubleCheckTextField = UITextField()
    let signUpButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setUpView() {
    
        addSubview(emailTextField)
        addSubview(nicknameTextField)
        addSubview(passwordTextField)
        addSubview(doubleCheckTextField)
        addSubview(signUpButton)
        
        [emailTextField, nicknameTextField, passwordTextField, doubleCheckTextField, signUpButton].forEach {
            self.addSubview($0)
        }
        
        emailTextField.textFieldConfig(placeholder: "이메일 주소", passwordOrNot: false)
        nicknameTextField.textFieldConfig(placeholder: "닉네임", passwordOrNot: false)
        passwordTextField.textFieldConfig(placeholder: "비밀번호", passwordOrNot: false)
        doubleCheckTextField.textFieldConfig(placeholder: "비밀번호 확인", passwordOrNot: false)
        signUpButton.buttonConfig(title: "가입하기")
        
    }
    
    func setUpConstraints() {
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        doubleCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(doubleCheckTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
    }
}
