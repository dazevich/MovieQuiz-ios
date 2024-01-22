//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Даниил Азевич on 22.01.2024.
//

import Foundation
import UIKit

class AlertPresenter {
    weak var delegate: UIViewController?
    
    func showGameResult(_ quizResult: QuizResultsViewModel, onPressed: @escaping () -> Void) -> Void {
        let data : AlertModel = AlertModel(
            title: quizResult.title,
            message: quizResult.text,
            buttonText: quizResult.buttonText,
            completion: onPressed
        );
        
        showGameResultAlert(data: data)
    }
    
    private func showGameResultAlert(data: AlertModel) -> Void {
        let alert = UIAlertController(
            title: data.title,
            message: data.message,
            preferredStyle: .alert)
        let action = UIAlertAction(title: data.buttonText, style: .default) { _ in
            data.completion()
        }
        
        alert.addAction(action)
        
        delegate?.present(alert, animated: true)
    }
}
