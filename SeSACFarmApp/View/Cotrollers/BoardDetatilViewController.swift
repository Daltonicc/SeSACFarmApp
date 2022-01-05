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
    
    var postID: Int = 0    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getBoardCommentData(postID: postID) {
            DispatchQueue.main.async {
                self.mainView.commentTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()

        mainView.commentTableView.delegate = self
        mainView.commentTableView.dataSource = self
        mainView.commentTableView.register(BoardDetailTableViewCell.self, forCellReuseIdentifier: BoardDetailTableViewCell.identifier)
        
        mainView.backgroundColor = .white
        navigationItemConfig()
        
    }
    
    func navigationItemConfig() {
        
        navigationItem.leftBarButtonItem = mainView.backBarButton
        navigationItem.rightBarButtonItem = mainView.categoryBarButton
        
        mainView.backBarButton.target = self
        mainView.backBarButton.action = #selector(backBarButtonClicked)
    }
    
    @objc func backBarButtonClicked() {
        
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension BoardDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.commentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BoardDetailTableViewCell.identifier, for: indexPath) as? BoardDetailTableViewCell else { return UITableViewCell() }
        
        let row = viewModel.commentData[indexPath.row]
        
        cell.nameLabel.text = row.user.username
        cell.commentLabel.text = row.comment
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
