//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Даниил Азевич on 22.01.2024.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: () -> Void
}
