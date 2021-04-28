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

struct Score: Codable {
    var correct: Double
    var answered: Double
}

extension UserDefaults {
    
    func getScore(category: Category) -> Score {
        
        if let savedUserData = UserDefaults.standard.object(forKey: category.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let savedScore = try? decoder.decode(Score.self, from: savedUserData) {
                print("Saved user: \(savedScore.answered)")
                return savedScore
            }
        }
        
        return Score(correct: 0.0, answered: 0.0)
    }
    
    func saveScore(category: Category, score: Score) {
//        UserDefaults.standard.set(percent, forKey: category.rawValue)
        
        let encoder = JSONEncoder()
        if let encodedScore = try? encoder.encode(score) {
            UserDefaults.standard.set(encodedScore, forKey: category.rawValue)
        }
    }
}
