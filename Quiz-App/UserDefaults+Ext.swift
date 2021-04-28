//
//  UserDefaults+Ext.swift
//  Quiz-App
//
//  Created by Kelby Mittan on 4/28/21.
//

import Foundation

enum Category: String {
    case dsa = "dsa"
    case ios = "ios"
    case swift = "swift"
}

extension UserDefaults {
    
//    static let dsaKey = "dsaKey"
//    static let iosKey = "iosKey"
//    static let swiftKey = "swiftKey"
    
    func getDSAStats(category: Category) -> Double {
        return UserDefaults.standard.object(forKey: category.rawValue) as? Double ?? 0.0
    }
    
    func saveScore(category: Category, percent: Double) {
        UserDefaults.standard.set(percent, forKey: category.rawValue)
    }
}
