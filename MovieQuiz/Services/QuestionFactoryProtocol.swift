//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Даниил Азевич on 22.01.2024.
//

import Foundation

protocol QuestionFactoryProtocol {
    func requestNextQuestion() -> QuizQuestion?
}
