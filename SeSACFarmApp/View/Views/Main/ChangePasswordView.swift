//
//  ChangePasswordView.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/12.
//

import Foundation
import UIKit
import SnapKit

class ChangePasswordView: UIView {
    
    let backBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "arrow.left")
        barButton.tintColor = .black
        return barButton
    }()
    let currentPasswordTextField = UITextField()
    let newPasswordTextField = UITextField()
    let confirmTextField = UITextField()
    let changeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setUpView() {
        
        [currentPasswordTextField, newPasswordTextField, confirmTextField, changeButton].forEach {
            self.addSubview($0)
        }
        
        currentPasswordTextField.textFieldConfig(placeholder: "현재 비밀번호", passwordOrNot: true)
        newPasswordTextField.textFieldConfig(placeholder: "새 비밀번호", passwordOrNot: true)
        confirmTextField.textFieldConfig(placeholder: "새 비밀번호 확인", passwordOrNot: true)
        changeButton.buttonConfig(title: "변경하기")
    }
    
    func setUpConstraints() {
        
        currentPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        newPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(currentPasswordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        confirmTextField.snp.makeConstraints { make in
            make.top.equalTo(newPasswordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        changeButton.snp.makeConstraints { make in
            make.top.equalTo(confirmTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
    }
}
