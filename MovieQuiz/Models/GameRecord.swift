//
//  GameRecord.swift
//  MovieQuiz
//
//  Created by Даниил Азевич on 22.01.2024.
//

import Foundation

struct GameRecord: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ other: GameRecord) -> Bool {
        let currentAccuracy: Double = Double(correct) / (Double(total) * 0.01)
        let otherAccurancy : Double = Double(other.correct) / (Double(other.total) * 0.01)
        
        return currentAccuracy > otherAccurancy;
    }
}
