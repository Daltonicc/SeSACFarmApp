//
//  WritingPostView.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/06.
//

import Foundation
import UIKit
import SnapKit

class WritingPostView: UIView {
    
    let cancelButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "xmark")
        barButton.tintColor = .black
        return barButton
    }()
    let successButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.title = "완료"
        barButton.tintColor = .black
        return barButton
    }()
    let writingView: UIView = {
        let view = UIView()
        view.addSidedBorder(toEdge: .top, withColor: .lightGray, inset: 0, thickness: 1)
        return view
    }()
    let writeTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15)
        return textView
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
        
        addSubview(writingView)
        addSubview(writeTextView)
    }
    
    func setConstraints() {
        
        writingView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalTo(self)
        }
        writeTextView.snp.makeConstraints { make in
            make.top.equalTo(writingView.snp.top).inset(20)
            make.leading.equalTo(writingView.snp.leading).inset(20)
            make.trailing.equalTo(writingView.snp.trailing).inset(20)
            make.bottom.equalTo(writingView.snp.bottom).inset(20)
        }
        
    }
}
