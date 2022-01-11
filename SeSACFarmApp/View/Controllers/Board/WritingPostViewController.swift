//
//  WritingPostViewController.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/06.
//

import Foundation
import UIKit

class WritingPostViewController: UIViewController {
    
    let mainView = WritingPostView()
    let viewModel = MainBoardViewModel()
    let commentViewModel = CommentViewModel()
    
    var newOrModify = false
    var postID: Int = 0
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        mainView.writeTextView.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItemConfig()
    }
    
    func navigationItemConfig() {
        
        navigationItem.title = "새싹농장 글쓰기"

        navigationItem.leftBarButtonItem = mainView.cancelButton
        navigationItem.rightBarButtonItem = mainView.successButton
        
        mainView.cancelButton.target = self
        mainView.cancelButton.action = #selector(backBarButtonClicked)
        mainView.successButton.target = self
        mainView.successButton.action = #selector(successButtonClicked)
    }
    
    @objc func backBarButtonClicked() {
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func successButtonClicked() {
        
        // 수정인지 새로운 게시물인지
        if !newOrModify {
            viewModel.postData(text: mainView.writeTextView.text) {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            print(postID)
            viewModel.changeData(postID: postID, text: mainView.writeTextView.text) {
                
                self.navigationController?.popViewController(animated: true)
            }
        }
        newOrModify = false
    }
}

