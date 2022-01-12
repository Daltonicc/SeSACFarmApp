//
//  LoginView.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/02.
//

import Foundation
import UIKit
import SnapKit

class LoginView: UIView {
    
    let backBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "arrow.left")
        barButton.tintColor = .black
        return barButton
    }()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    
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
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        emailTextField.textFieldConfig(placeholder: "이메일 주소", passwordOrNot: false)
        passwordTextField.textFieldConfig(placeholder: "비밀번호", passwordOrNot: true)
        loginButton.buttonConfig(title: "로그인")
    }
    
    func setUpConstraints() {
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
    }
    
    
}
