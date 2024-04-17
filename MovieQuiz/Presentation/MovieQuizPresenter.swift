//
//  MovieQuizPresenter.swift
//  MovieQuiz
//
//  Created by Даниил Азевич on 16.04.2024.
//
import UIKit
import Foundation


final class MovieQuizPresenter {
    
    private var currentIndex: Int = 0
    let questionsAmount: Int = 10
    var currentQuestion: QuizQuestion?
    weak var viewController: MovieQuizViewController?
    
    func isLastQuestion() -> Bool {
        currentIndex == questionsAmount - 1
    }
    
    func resetQuestionIndex() {
        currentIndex = 0
    }
    
    func switchToNextQuestion() {
        currentIndex += 1
    }
    
    func convert(model: QuizQuestion) -> QuizStepViewModel {
        let image = UIImage(data: model.image) ?? UIImage()
        let question = "Рейтинг этого фильма больше 7?"
        let questionNumber = "\(currentIndex+1)/\(questionsAmount)";
        
        return QuizStepViewModel(image: image, question: question, questionNumber: questionNumber)
    }
    
    func yesButtonClicked() {
        guard let currentQuestion = currentQuestion else {
            return
        }
        
        let givenAnswer = true
        
        viewController?.showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    
    func noButtonClicked() {
        guard let currentQuestion = currentQuestion else {
            return
        }

        let givenAnswer = false

        viewController?.showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
}
