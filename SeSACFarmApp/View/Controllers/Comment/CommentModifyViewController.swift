//
//  CommentModifyViewController.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/06.
//

import Foundation
import UIKit

class CommentModifyViewController: UIViewController {
    
    let mainView = CommentModifyView()
    let viewModel = CommentViewModel()
    
    var postId: Int = 0
    var writerId: Int = 0
    var commentId: Int = 0
    
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
        
        navigationItem.title = "댓글 수정"

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
        
        viewModel.changeCommentData(postID: postId, commentID: commentId, text: mainView.writeTextView.text) {
            self.navigationController?.popViewController(animated: true)
        }
        
    }

}
