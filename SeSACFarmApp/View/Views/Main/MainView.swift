//
//  MainView.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/02.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MainImage")
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "당신 근처의 새싹농장"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS 지식부터 바람의 나라까지\n지금 SeSAC에서 함께해보세요!"
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    let startButton = UIButton()
    let alreadyHaveLabel: UILabel = {
        let label = UILabel()
        label.text = "이미 계정이 있나요?"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setUpView() {

        [mainImageView, titleLabel, subTitleLabel, startButton, alreadyHaveLabel, loginButton].forEach {
            self.addSubview($0)
        }
        
        startButton.buttonConfig(title: "시작하기")
    }
    
    func setUpConstraints() {
        
        mainImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(self.snp.width).multipliedBy(0.3)
            make.height.equalTo(self.snp.height).multipliedBy(0.2)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(alreadyHaveLabel.snp.top).offset(-15)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        alreadyHaveLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-50)
            make.centerX.equalToSuperview().offset(-30)
        }
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-44)
            make.leading.equalTo(alreadyHaveLabel.snp.trailing).offset(5)
        }
    }
}
