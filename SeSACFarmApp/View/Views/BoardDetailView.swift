//
//  BoardDetailView.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/05.
//

import Foundation
import UIKit
import SnapKit

class BoardDetailView: UIView {
    
    let backBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "arrow.left")
        barButton.tintColor = .black
        return barButton
    }()
    let categoryBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "line.3.horizontal")
        barButton.tintColor = .black
        return barButton
    }()
    let writerView: UIView = {
        let view = UIView()
        view.addSidedBorder(toEdge: .top, withColor: .lightGray, inset: 0, thickness: 1)
        return view
    }()
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.tintColor = .lightGray
        return imageView
    }()
    let writerLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "name"
        return label
    }()
    let createDtLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15)
        label.text = "date"
        return label
    }()
    let contentView: UIView = {
        let view = UIView()
        view.addSidedBorder(toEdge: .top, withColor: .lightGray, inset: 10, thickness: 1)
        view.addSidedBorder(toEdge: .bottom, withColor: .lightGray, inset: 10, thickness: 1)
        return view
    }()
    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.text = "contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent"
        textView.isEditable = false
        return textView
    }()
    let commentCountView: UIView = {
        let view = UIView()
        view.addSidedBorder(toEdge: .bottom, withColor: .lightGray, inset: 10, thickness: 1)
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
        label.text = "댓글"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    let commentTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        return tableView
    }()
    let commentWritingView: UIView = {
        let view = UIView()
        view.addSidedBorder(toEdge: .top, withColor: .lightGray, inset: 10, thickness: 1)
        return view
    }()
    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " 댓글을 입력해주세요"
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUp()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
    }
    
    func setUp() {
     
        addSubview(writerView)
        addSubview(contentView)
        addSubview(commentCountView)
        addSubview(commentTableView)
        addSubview(commentWritingView)
        
        writerView.addSubview(profileImageView)
        writerView.addSubview(writerLabel)
        writerView.addSubview(createDtLabel)
        
        contentView.addSubview(contentTextView)
        
        commentCountView.addSubview(commentImageView)
        commentCountView.addSubview(commentCountLabel)
        
        commentWritingView.addSubview(commentTextField)
    }
    
    func setConstraints() {
        //writerView
        writerView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(0)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(60)
        }
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(writerView.snp.top).inset(10)
            make.leading.equalTo(writerView.snp.leading).inset(20)
            make.bottom.equalTo(writerView.snp.bottom).inset(10)
            make.width.height.equalTo(40)
        }
        writerLabel.snp.makeConstraints { make in
            make.top.equalTo(writerView.snp.top).inset(10)
            make.leading.equalTo(profileImageView.snp.trailing).offset(5)
            make.height.equalTo(20)
        }
        createDtLabel.snp.makeConstraints { make in
            make.top.equalTo(writerLabel.snp.bottom).offset(2)
            make.leading.equalTo(profileImageView.snp.trailing).offset(5)
            make.bottom.equalTo(writerView.snp.bottom).inset(10)
            make.height.equalTo(20)
        }
        //contentView
        contentView.snp.makeConstraints { make in
            make.top.equalTo(writerView.snp.bottom)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(250)
        }
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(30)
            make.leading.equalTo(contentView.snp.leading).inset(20)
            make.trailing.equalTo(contentView.snp.trailing).inset(20)
            make.bottom.equalTo(contentView.snp.bottom).inset(30)
        }
        //commentCountView
        commentCountView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.bottom)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(40)
        }
        commentImageView.snp.makeConstraints { make in
            make.top.equalTo(commentCountView.snp.top).inset(10)
            make.leading.equalTo(commentCountView.snp.leading).inset(20)
            make.bottom.equalTo(commentCountView.snp.bottom).inset(10)
            make.width.equalTo(20)
        }
        commentCountLabel.snp.makeConstraints { make in
            make.top.equalTo(commentCountView.snp.top).inset(10)
            make.leading.equalTo(commentImageView.snp.trailing).offset(5)
            make.bottom.equalTo(commentCountView.snp.bottom).inset(10)
            make.height.equalTo(20)
        }
        //commentTableView
        commentTableView.snp.makeConstraints { make in
            make.top.equalTo(commentCountView.snp.bottom)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(commentWritingView.snp.top)
//            make.height.equalTo(200)
        }
        //commentWritingView
        commentWritingView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).inset(30)
            make.height.equalTo(50)
        }
        commentTextField.snp.makeConstraints { make in
            make.top.equalTo(commentWritingView.snp.top).inset(5)
            make.leading.equalTo(commentWritingView.snp.leading).inset(20)
            make.trailing.equalTo(commentWritingView.snp.trailing).inset(20)
            make.bottom.equalTo(commentWritingView.snp.bottom).inset(5)
        }
        
        
    }
    
    
}
