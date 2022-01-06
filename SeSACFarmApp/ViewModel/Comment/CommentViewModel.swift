//
//  CommentViewModel.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/06.
//

import Foundation

class CommentViewModel {
    
    var token: String = UserDefaults.standard.string(forKey: "token") ?? ""
    var userID: Int = UserDefaults.standard.integer(forKey: "userID")
    
    var commentData: [CommentForDetailBoard] = []

    func getBoardCommentData(postID: Int, completion: @escaping () -> Void) {
        
        APIService.getComment(postID: postID, token: token) { commentData, error in
            
            guard let commentData = commentData else { return }
            print(commentData)
            
            self.commentData = commentData
            
            completion()
        }
    }
    
    func postCommentData(postID: Int, text: String, token: String, completion: @escaping () -> Void) {
        
        APIService.postComment(postID: postID, text: text, token: token) { commentData, error in
            
            guard let commentData = commentData else {
                return
            }
            
            
            completion()

        }
    }
    
    func changeCommentData(postID: Int, commentID: Int, text: String, completion: @escaping () -> Void) {
        
        APIService.changeComment(commentID: commentID, postID: postID, token: token, text: text) { commentData, error in
            
            guard let commentData = commentData else {
                return
            }

            
            completion()
        }
    }
    
    func deleteCommentData(commentID: Int, completion: @escaping () -> Void) {
        
        APIService.deleteComment(commentID: commentID, token: token) { commentData, error in
            
            guard let commentData = commentData else {
                return
            }
            
            completion()
        }
    }
    
}
