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
        
        viewModel.getBoardData {
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
        mainView.tableView.register(MainBoardTableViewCell.self, forCellReuseIdentifier: MainBoardTableViewCell.identifier)
        
    }
    
    @objc func commentButtonClicked() {
        
        print("comment Clicked")
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
        cell.createDateLabel.text = row.createdAt
        cell.commentButton.addTarget(self, action: #selector(commentButtonClicked), for: .touchUpInside)

        
        if row.comments?.count == 0 {
            cell.commentButton.setTitle("댓글쓰기", for: .normal)
        } else {
            cell.commentButton.setTitle("댓글 \(row.comments!.count)", for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




