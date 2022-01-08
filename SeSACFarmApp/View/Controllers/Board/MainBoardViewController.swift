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
    var dataNumber = 0

    
    override func loadView() {
        
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getBoardData(startNumber: 0) {
            DispatchQueue.main.async {
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
        

    }
    
    //댓글 버튼 누르면 바로 댓글 입력으로 연결
    @objc func commentButtonClicked() {
        
        
        
    }
    
    @objc func createPostButtonClicked() {
        
        let vc = WritingPostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainBoardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.boardData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainBoardTableViewCell.identifier, for: indexPath) as? MainBoardTableViewCell else { return UITableViewCell() }
        
        let row = viewModel.boardData[indexPath.row]
        
        cell.nicknameLabel.text = row.user.username
        cell.contentLabel.text = row.text
        cell.createDateLabel.text = row.createdAt.toDate
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
        vc.mainView.writerLabel.text = row.user.username
        vc.mainView.contentTextView.text = row.text
        vc.mainView.createDtLabel.text = row.createdAt.toDate
        vc.postWriterID = row.user.id
        vc.postID = row.id
    }
}

extension MainBoardViewController: UITableViewDataSourcePrefetching {
    
    // prefetch 구현했지만 데이터가 이상하게 넘어옴.
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
//        for indexPath in indexPaths {
//            if viewModel.boardData.count - 1 == indexPath.row {
//                dataNumber += 20
//                viewModel.getBoardData(startNumber: dataNumber) {
//                    DispatchQueue.main.async {
//                        self.mainView.tableView.reloadData()
//                    }
//                    
//                }
//            }
//        }
//    }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        
    }
    
}



