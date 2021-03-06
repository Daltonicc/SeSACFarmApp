//
//  MainPostViewController.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/03.
//

import Foundation
import UIKit

class MainBoardViewController: UIViewController {
    
    let mainView = MainBoardView()
    let viewModel = MainBoardViewModel()
    
    override func loadView() {
        
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getBoardData { error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    switch error {
                    case .invalidToken: self.invalidTokenAlert()
                    default: showToast(vc: self, message: "다시 로그인해주세요")
                    }
                    return
                }
                self.mainView.tableView.reloadData()
                self.mainView.two.text = "댓글 \(self.viewModel.allCommentCount)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.prefetchDataSource = self
        mainView.tableView.register(MainBoardTableViewCell.self, forCellReuseIdentifier: MainBoardTableViewCell.identifier)
        
        mainView.writeButton.addTarget(self, action: #selector(createPostButtonClicked), for: .touchUpInside)
        mainView.settingButton.addTarget(self, action: #selector(settingButtonClicked), for: .touchUpInside)
        

    }
    
    func changeDateFormatting(date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        var newDate = dateFormatter.date(from: date) ?? Date()
        //시차 맞춰주기(한국 시간으로 맞췄지만 안맞아서 새로 맞춤)
        newDate.addTimeInterval(60 * 60 * 9)
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.locale = Locale(identifier: "ko-KR")
        dateFormatter2.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter2.dateFormat = "MM/dd HH:mm"
        
        return dateFormatter2.string(from: newDate)
    }
    
    //댓글 버튼 누르면 바로 댓글 입력으로 연결
    @objc func commentButtonClicked(sender: UIButton) {
        
        let boardData = viewModel.boardData[sender.tag]
        let vc = BoardDetailViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
        
        vc.mainView.writerLabel.text = boardData.postUser.writerName
        vc.mainView.contentTextView.text = boardData.postText
        vc.mainView.createDtLabel.text = changeDateFormatting(date: boardData.createdAt)
        vc.postWriterID = boardData.postUser.writerId
        vc.postID = boardData.postId
        vc.commentFirstRespond = true
    }
    
    @objc func createPostButtonClicked() {
        
        customPushViewController(pushVC: WritingPostViewController())
    }
    
    @objc func settingButtonClicked() {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let passwordChange = UIAlertAction(title: "비밀번호 변경", style: .default) { UIAlertAction in
            self.customPresentViewController(presentVC: ChangePasswordViewController(), completion: nil)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        cancel.setValue(UIColor.red, forKey: "titleTextColor")
        
        alert.addAction(passwordChange)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}

extension MainBoardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.boardData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainBoardTableViewCell.identifier, for: indexPath) as? MainBoardTableViewCell else { return UITableViewCell() }
        
        let row = viewModel.boardData[indexPath.row]
        
        cell.nicknameLabel.text = row.postUser.writerName
        cell.contentLabel.text = row.postText
        cell.createDateLabel.text = changeDateFormatting(date: row.createdAt)
        cell.commentButton.tag = indexPath.row
        cell.commentButton.addTarget(self, action: #selector(commentButtonClicked), for: .touchUpInside)

        if row.comments.count == 0 {
            cell.commentButton.setTitle("댓글쓰기", for: .normal)
        } else {
            cell.commentButton.setTitle("댓글 \(row.comments.count)", for: .normal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let row = viewModel.boardData[indexPath.row]
        let vc = BoardDetailViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        
        //디테일뷰로 작성자명, 작성자아이디, 내용, 작성일 넘겨줌.
        vc.mainView.writerLabel.text = row.postUser.writerName
        vc.mainView.contentTextView.text = row.postText
        vc.mainView.createDtLabel.text = changeDateFormatting(date: row.createdAt)
        vc.postWriterID = row.postUser.writerId
        vc.postID = row.postId
        vc.commentFirstRespond = false
    }
}

extension MainBoardViewController: UITableViewDataSourcePrefetching {
    
    // prefetch 구현했지만 데이터가 이상하게 넘어옴.
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
//        for indexPath in indexPaths {
//            if viewModel.boardData.count - 1 == indexPath.row {
//                viewModel.dataNumber += 50
//                viewModel.getBoardData {
//
//                    self.mainView.tableView.reloadData()
//
//                }
//                print(#function)
//
//            }
//        }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        
    }
    
}



