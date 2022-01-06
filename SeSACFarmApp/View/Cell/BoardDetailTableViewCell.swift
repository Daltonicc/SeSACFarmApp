//
//  BoardDetailTableViewCell.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/05.
//

import UIKit
import SnapKit

class BoardDetailTableViewCell: UITableViewCell {

    static let identifier = "BoardDetailTableViewCell"

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.text = "Writer"
        return label
    }()
    let commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.text = "contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent"
        label.numberOfLines = 0
        return label
    }()
    let statusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(commentLabel)
        contentView.addSubview(statusButton)
    }
    
    func setConstraints() {
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(20)
            make.leading.equalTo(contentView.snp.leading).inset(20)
            make.height.equalTo(20)
        }
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(contentView.snp.leading).inset(20)
            make.trailing.equalTo(statusButton.snp.leading).inset(10)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
        }
        statusButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(20)
            make.trailing.equalTo(contentView.snp.trailing).inset(20)
            make.width.height.equalTo(20)
        }
        
    }
}
