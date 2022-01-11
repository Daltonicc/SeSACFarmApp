//
//  DateFormatter.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/06.
//

import Foundation

extension String {
    var toDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = formatter.date(from: self) ?? Date()
        return date.toString
    }
}

extension Date {
    var toString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "MM/dd HH:mm"
        return formatter.string(from: self)
    }
}
