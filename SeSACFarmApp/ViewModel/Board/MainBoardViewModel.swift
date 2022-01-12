//
//  MainPostViewModel.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/03.
//

import Foundation

class MainBoardViewModel {
    
    var token: String = UserDefaults.standard.string(forKey: "token") ?? ""
    var userID: Int = UserDefaults.standard.integer(forKey: "userID")
    var boardData: [BoardElement] = []
    
    var allCommentCount: Int = 0
    var dataNumber: Int = 0
    
    func getBoardData(completion: @escaping () -> Void) {
        
        APIService.getPost(token: token, startNumber: dataNumber) { boardData, error in
            
            guard let boardData = boardData else { return }
            
            self.boardData = boardData
            self.allCommentCount = 0
            
            for i in boardData {
                self.allCommentCount += i.comments.count
            }
            completion()
        }
    }
    

    
    func postData(text: String, completion: @escaping () -> Void) {
        
        APIService.postPost(token: token, text: text) { postData, error in
            
            guard let postData = postData else { return }
            
            completion()
        }
    }
    
    func changeData(postID: Int, text: String, completion: @escaping () -> Void) {
        
        APIService.changePost(postID: postID, token: token, text: text) { boardData, error in
            
            guard let boardData = boardData else { return }
            
            completion()
        }
            
    }
    
    func deleteData(postID: Int, completion: @escaping () -> Void) {
        
        APIService.deletePost(postID: postID, token: token) { boardData, error in
            
            guard let boardData = boardData else { return }
            
            completion()
        }
    }
    

}
