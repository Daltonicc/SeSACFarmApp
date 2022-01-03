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
        label.backgroundColor = .white
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
    let commentCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15)
        label.text = "댓글"
        return label
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
        
        addSubview(separateView)
        addSubview(nicknameLabel)
        addSubview(contentLabel)
        addSubview(createDateLabel)
        addSubview(commentView)
        commentView.addSubview(commentImageView)
        commentView.addSubview(commentCountLabel)
    }
    
    func setUpConstraints() {
        
        separateView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(5)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(separateView.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.height.equalTo(20)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).inset(20)
        }
        createDateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        commentView.snp.makeConstraints { make in
            make.top.equalTo(createDateLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(44)
        }
        commentImageView.snp.makeConstraints { make in
            make.top.equalTo(commentView.snp.top).inset(10)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.bottom.equalTo(commentView.snp.bottom).inset(10)
        }
        commentCountLabel.snp.makeConstraints { make in
            make.top.equalTo(commentView.snp.top).inset(10)
            make.leading.equalTo(commentImageView.snp.trailing).offset(10)
            make.bottom.equalTo(commentView.snp.bottom).inset(10)
        }
    }
}


