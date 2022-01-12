//
//  APIService.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/02.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case noData
    case failed
    case invalidData
    case identifierOrPasswordFailed
    case invalidToken
}

class APIService {
    
    //메서드를 통일 시켜보고 싶었지만 실패. 개선 필요
    static func login(identifier: String, password: String, completion: @escaping (UserData?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.login.url)
        request.httpMethod = Method.POST.rawValue
        request.httpBody = "identifier=\(identifier)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func signUp(username: String, email: String, password: String, completion: @escaping (UserData?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.signUP.url)
        request.httpMethod = Method.POST.rawValue
        request.httpBody = "username=\(username)&email=\(email)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func changePassword(token: String, currentPassword: String, newPassword: String, confirmPassword: String, completion: @escaping (User?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.changePassword.url)
        request.httpMethod = Method.POST.rawValue
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = "currentPassword=\(currentPassword)&newPassword=\(newPassword)&confirmNewPassword=\(confirmPassword)".data(using: .utf8, allowLossyConversion: false)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func getPost(token: String, startNumber: Int, completion: @escaping ([BoardElement]?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.getPosts(start: startNumber).url)
        request.httpMethod = Method.GET.rawValue
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        print(completion)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func postPost(token: String, text: String, completion: @escaping (BoardElement?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.postPost.url)
        request.httpMethod = Method.POST.rawValue
        request.httpBody = "text=\(text)".data(using: .utf8)
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        print(completion)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func changePost(postID: Int, token: String, text: String, completion: @escaping (BoardElement?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.changePost(id: postID).url)
        request.httpMethod = Method.PUT.rawValue
        request.httpBody = "text=\(text)".data(using: .utf8)
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        print(completion)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func deletePost(postID: Int, token: String, completion: @escaping (BoardElement?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.deletePost(id: postID).url)
        request.httpMethod = Method.DELETE.rawValue
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        print(completion)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func getDetailPost(postID: Int, token: String, completion: @escaping (Post?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.getDetailPost(id: postID).url)
        request.httpMethod = Method.GET.rawValue
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        print(completion)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func getComment(postID: Int, token: String, completion: @escaping ([CommentForDetailBoard]?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.getComment(id: postID).url)
        request.httpMethod = Method.GET.rawValue
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        print(completion)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func postComment(postID: Int, text: String, token: String, completion: @escaping (PostComment?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.postComment.url)
        request.httpMethod = Method.POST.rawValue
        request.httpBody = "comment=\(text)&post=\(postID)".data(using: .utf8)
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        print(completion)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func changeComment(commentID: Int, postID: Int, token: String, text: String, completion: @escaping (CommentForDetailBoard?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.changeComment(id: commentID).url)
        request.httpMethod = Method.PUT.rawValue
        request.httpBody = "comment=\(text)&post=\(postID)".data(using: .utf8)
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        print(completion)
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func deleteComment(commentID: Int, token: String, completion: @escaping (CommentForDetailBoard?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.deleteComment(id: commentID).url)
        request.httpMethod = Method.DELETE.rawValue
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        print(completion)
        
        URLSession.request(endpoint: request, completion: completion)
    }

}
