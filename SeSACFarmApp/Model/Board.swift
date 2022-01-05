//
//  Board.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/03.
//

import Foundation

struct BoardElement: Codable {
    let id: Int
    let text: String
    let user: UserBoard
    let createdAt, updatedAt: String
    let comments: [Comment]?

    enum CodingKeys: String, CodingKey {
        case id, text, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case comments
    }
}

struct UserBoard: Codable {
    let id: Int
    let username: String
}

struct Comment: Codable {
    let id: Int
    let comment: String
}

