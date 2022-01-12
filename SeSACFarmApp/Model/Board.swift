//
//  Board.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/03.
//

import Foundation


struct BoardElement: Codable {
    let postId: Int
    let postText: String
    let postUser: UserBoard
    let createdAt, updatedAt: String
    let comments: [CommentForMain]

    enum CodingKeys: String, CodingKey {
        case postId = "id"
        case postText = "text"
        case postUser = "user"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case comments = "comments"
    }
}

struct UserBoard: Codable {
    let writerId: Int
    let writerName: String
    
    enum CodingKeys: String, CodingKey {
        case writerId = "id"
        case writerName = "username"
    }
}

struct CommentForMain: Codable {
    let commentId: Int
    let commentText: String
    let postId: Int
    
    enum CodingKeys: String, CodingKey {
        case commentId = "id"
        case commentText = "comment"
        case postId = "post"
    }
}

struct CommentForDetailBoard: Codable {
    let commentId: Int
    let commentText: String
    let commentUser: UserBoard
    let post: Post
    
    enum CodingKeys: String, CodingKey {
        case commentId = "id"
        case commentText = "comment"
        case commentUser = "user"
        case post = "post"
    }
}

struct Post: Codable {
    let postId: Int
    let postText: String
    
    enum CodingKeys: String, CodingKey {
        case postId = "id"
        case postText = "text"
    }
}

struct PostComment: Codable {
    let commentId: Int
    let commentText: String
    let commentUser: UserBoard
    
    enum CodingKeys: String, CodingKey {
        case commentId = "id"
        case commentText = "comment"
        case commentUser = "user"
    }
}

