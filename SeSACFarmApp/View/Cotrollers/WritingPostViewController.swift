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
    
    var newOrModify = false
    var postID: Int = 0
    
    override func loadView() {
        self.view = mainView
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
        
        if !newOrModify {
            viewModel.postData(text: mainView.writeTextView.text) {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            print(postID)
            viewModel.changeData(postID: postID, text: mainView.writeTextView.text) {
                let vc = BoardDetailViewController()
                vc.mainView.contentTextView.text = self.mainView.writeTextView.text
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        newOrModify = false
    }
}
