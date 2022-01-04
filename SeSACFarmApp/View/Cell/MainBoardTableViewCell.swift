//
//  MainBoardTableViewCell.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/03.
//

import UIKit
import SnapKit

class MainBoardTableViewCell: UITableViewCell {

    static let identifier = "MainBoardTableViewCell"
    
    let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray5
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15)
        label.layer.cornerRadius = 5
        label.text = "nickname"
        return label
    }()
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.text = "contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent"
        return label
    }()
    let createDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15)
        label.text = "date"
        return label
    }()
    let commentView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    let commentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bubble.right")
        imageView.tintColor = .lightGray
        return imageView
    }()
    let commentButton: UIButton = {
        let button = UIButton()
        button.setTitle("댓글", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpView() {
        
        contentView.addSubview(separateView)
        contentView.addSubview(nicknameLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(createDateLabel)
        contentView.addSubview(commentView)
        
        commentView.addSubview(commentButton)
        commentView.addSubview(commentImageView)
    }
    
    func setUpConstraints() {
        
        separateView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(5)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(separateView.snp.bottom).offset(10)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.height.equalTo(20)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(10)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).inset(20)
        }
        createDateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(20)
        }
        commentView.snp.makeConstraints { make in
            make.top.equalTo(createDateLabel.snp.bottom).offset(20)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom)
            make.height.equalTo(44)
        }
        commentImageView.snp.makeConstraints { make in
            make.top.equalTo(commentView.snp.top).inset(10)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.bottom.equalTo(commentView.snp.bottom).inset(10)
        }
        commentButton.snp.makeConstraints { make in
            make.top.equalTo(commentView.snp.top).inset(10)
            make.leading.equalTo(commentImageView.snp.trailing).offset(10)
            make.bottom.equalTo(commentView.snp.bottom).inset(10)
        }
    }
    

}


