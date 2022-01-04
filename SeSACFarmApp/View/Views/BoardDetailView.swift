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
    
    let writerView: UIView = {
        let view = UIView()
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
        return view
    }()
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.text = "contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent"
        return label
    }()
    let commentCountView: UIView = {
        let view = UIView()
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
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    let commentView: UIView = {
        let view = UIView()
        return view
    }()
    let commentTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
//    let commentWriterLabel: UILabel = {
//        let label = UILabel()
//        label.font = .boldSystemFont(ofSize: 15)
//        label.text = "name"
//        return label
//    }()
//    let commentContentLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 17)
//        label.numberOfLines = 0
//        label.text = "contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent"
//        return label
//    }()
//    let reviseButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
//        button.tintColor = .lightGray
//        return button
//    }()
    
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
        addSubview(commentView)
        
        writerView.addSubview(profileImageView)
        writerView.addSubview(writerLabel)
        writerView.addSubview(createDtLabel)
        
        contentView.addSubview(contentLabel)
        
        commentCountView.addSubview(commentImageView)
        commentCountView.addSubview(commentCountLabel)
        
        commentView.addSubview(commentTextField)
        
//        commentView.addSubview(commentWriterLabel)
//        commentView.addSubview(commentContentLabel)
//        commentView.addSubview(reviseButton)
    }
    
    func setConstraints() {
        
        
        
    }
    
    
}
