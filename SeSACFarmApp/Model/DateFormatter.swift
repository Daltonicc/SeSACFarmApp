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
        var date = formatter.date(from: self) ?? Date()
        //시차 맞춰주기(한국 시간으로 맞췄지만 안맞아서 새로 맞춤)
        date.addTimeInterval(60 * 60 * 9)
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
