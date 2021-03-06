//
//  BoardDetatilViewController.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/05.
//

import Foundation
import UIKit

class BoardDetailViewController: UIViewController {
    
    let mainView = BoardDetailView()
    let viewModel = MainBoardViewModel()
    let commentViewModel = CommentViewModel()
    
    var willShowToken: NSObjectProtocol?
    var willHideToken: NSObjectProtocol?
    
    var postID: Int = 0
    var postWriterID: Int = 0
    var commentFirstRespond = false
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        commentViewModel.getBoardCommentData(postID: postID) {
            DispatchQueue.main.async {
                self.mainView.commentTableView.reloadData()
                self.mainView.commentCountLabel.text = "댓글 \(self.commentViewModel.commentData.count)개"
                
                self.noCommentLabelCheck()
            }
        }
        commentViewModel.getDetailPostData(postID: postID) { error in
            
            guard error == nil else {
                switch error {
                case .invalidToken: self.invalidTokenAlert()
                default: showToast(vc: self, message: "다시 로그인해주세요")
                }
                return
            }
            self.mainView.contentTextView.text = self.commentViewModel.postData?.postText
        }
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()

        mainView.commentTableView.delegate = self
        mainView.commentTableView.dataSource = self
        mainView.commentTableView.register(BoardDetailTableViewCell.self, forCellReuseIdentifier: BoardDetailTableViewCell.identifier)
        mainView.commentTextField.addTarget(self, action: #selector(commentTextFieldClicked), for: .editingDidEndOnExit)
        
        mainView.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        navigationItemConfig()
        categoryBarButtonMenu()
        
        //추후에 수정필요. 이렇게하면 키보드노티가 기능을 안함.
//        if commentFirstRespond {
//            mainView.commentTextField.becomeFirstResponder()
//        }
    }
    
    func navigationItemConfig() {
        
        navigationItem.leftBarButtonItem = mainView.backBarButton
        navigationItem.rightBarButtonItem = mainView.categoryBarButton
        
        mainView.backBarButton.target = self
        mainView.backBarButton.action = #selector(backBarButtonClicked)
    }
    
    func categoryBarButtonMenu() {
        
        if viewModel.userID == postWriterID {
            let modifyAction = UIAction(title: "수정", image: UIImage(systemName: "pencil")) { _ in
                let vc = WritingPostViewController()
                vc.mainView.writeTextView.text = self.mainView.contentTextView.text
                vc.postID = self.postID
                vc.newOrModify = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
            let deleteAction = UIAction(title: "삭제", image: UIImage(systemName: "trash.fill")) { _ in
                
                self.warningAlert { action in
                    self.viewModel.deleteData(postID: self.postID) {
                        self.navigationController?.dismiss(animated: true, completion: nil)
                    }
                }
            }
            let cancelAction = UIAction(title: "취소", attributes: .destructive) { _ in
                
            }
            mainView.categoryBarButton.menu = UIMenu(
                title: "수정/삭제",
                image: nil,
                identifier: nil,
                options: .displayInline,
                children: [modifyAction, deleteAction, cancelAction])
        } else {
            mainView.categoryBarButton.target = self
            mainView.categoryBarButton.action = #selector(categoryButtonClicked)
        }
    }
    
    func noCommentLabelCheck() {
        
        //댓글 없으면 댓글 없다는 레이블
        if commentViewModel.commentData.count == 0 {
            mainView.noCommentLabel.isHidden = false
        } else {
            mainView.noCommentLabel.isHidden = true
        }
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func commentTextFieldClicked() {
        
        guard mainView.commentTextField.text != "" else {
            showToast(vc: self, message: "댓글을 입력해주세요!")
            return
        }
        
        if let text = mainView.commentTextField.text {
            commentViewModel.postCommentData(postID: postID, text: text, token: viewModel.token) {
                self.mainView.commentTextField.text = ""
                self.commentViewModel.getBoardCommentData(postID: self.postID) {
                    self.mainView.commentCountLabel.text = "댓글 \(self.commentViewModel.commentData.count)개"
                    self.noCommentLabelCheck()
                    self.mainView.commentTableView.reloadData()
                }
            }
        }
    }
    
    @objc func commentStatusButtonClicked(sender: UIButton) {
        
        let commentData = commentViewModel.commentData[sender.tag]
        let writerId = commentData.commentUser.writerId
        
        if writerId == viewModel.userID {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let modifyAction = UIAlertAction(title: "수정", style: .default) { _ in
                let vc = CommentModifyViewController()
                vc.postId = commentData.post.postId
                vc.writerId = writerId
                vc.commentId = commentData.commentId
                vc.mainView.writeTextView.text = commentData.commentText
                self.navigationController?.pushViewController(vc, animated: true)
            }
            let deleteAction = UIAlertAction(title: "삭제", style: .default) { _ in
                self.warningAlert { okAction in
                    self.commentViewModel.deleteCommentData(commentID: commentData.commentId) {
                        self.commentViewModel.getBoardCommentData(postID: self.postID) {
                            self.mainView.commentCountLabel.text = "댓글 \(self.commentViewModel.commentData.count)개"
                            self.noCommentLabelCheck()
                            self.mainView.commentTableView.reloadData()
                        }
                    }
                }
            }
            deleteAction.setValue(UIColor.red, forKey: "titleTextColor")

            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            alert.addAction(modifyAction)
            alert.addAction(deleteAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
        } else {
            showToast(vc: self, message: "본인이 작성한 댓글만\n 수정할 수 있습니다.")
        }
    }
    
    @objc func backBarButtonClicked() {
        
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func categoryButtonClicked() {
        
        showToast(vc: self, message: "본인이 작성한 글만\n 수정할 수 있습니다.")
    }
}

extension BoardDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return commentViewModel.commentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BoardDetailTableViewCell.identifier, for: indexPath) as? BoardDetailTableViewCell else { return UITableViewCell() }
        
        let row = commentViewModel.commentData[indexPath.row]
        
        cell.statusButton.tag = indexPath.row
        cell.nameLabel.text = row.commentUser.writerName
        cell.commentLabel.text = row.commentText
        cell.statusButton.addTarget(self, action: #selector(commentStatusButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
