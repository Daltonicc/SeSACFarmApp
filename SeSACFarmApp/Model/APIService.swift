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
}

class APIService {
    
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
    
    static func getPost(token: String, completion: @escaping ([BoardElement]?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.getPosts.url)
        request.httpMethod = Method.GET.rawValue
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        print(completion)
        
        URLSession.boardRequest(endpoint: request, completion: completion)
    }
    
    static func getComment(postID: Int, token: String, completion: @escaping ([CommentForDetailBoard]?, APIError?) -> Void) {
        
        var request = URLRequest(url: EndPoint.getComment(id: postID).url)
        request.httpMethod = Method.GET.rawValue
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        print(completion)
        
        URLSession.boardRequest(endpoint: request, completion: completion)
    }

}
