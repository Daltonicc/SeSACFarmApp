//
//  MainBoardView.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/03.
//

import Foundation
import UIKit
import SnapKit

class MainBoardView: UIView {
    
    let titleView: UIView = {
        let view = UIView()
        return view
    }()
    let one: UILabel = {
        let label = UILabel()
        label.text = "새싹농장"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        label.sizeToFit()
        return label
    }()
    let commentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bubble.right")
        imageView.tintColor = .lightGray
        return imageView
    }()
    let two: UILabel = {
        let label = UILabel()
        label.text = "댓글"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.sizeToFit()
        return label
    }()
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        return tableView
    }()
    let writeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.cornerRadius = 30
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
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
        
        addSubview(titleView)
        addSubview(tableView)
        addSubview(writeButton)
        
        titleView.addSubview(one)
        titleView.addSubview(commentImageView)
        titleView.addSubview(two)
    }
    
    func setUpConstraints() {
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(-30)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(100)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).inset(10)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(self)
        }
        writeButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        one.snp.makeConstraints { make in
            make.top.equalTo(titleView).inset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
        commentImageView.snp.makeConstraints { make in
            make.top.equalTo(one.snp.bottom).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
        two.snp.makeConstraints { make in
            make.top.equalTo(one.snp.bottom).offset(10)
            make.leading.equalTo(commentImageView.snp.trailing).offset(5)
        }
    }
}

