//
//  AlertPresenterDelegate.swift
//  MovieQuiz
//
//  Created by Даниил Азевич on 22.01.2024.
//

import Foundation

protocol AlertPresenterDelegate : AnyObject {
    func didAlertClosed() -> Void
}
