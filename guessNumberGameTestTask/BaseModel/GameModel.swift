//
//  GameModel.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 22.01.2023.
//

import Foundation


struct GameModel {
    var humanNumber: Int = 0
    var computerNumber: Int = 0
    var tryGuess: Int = 1
}

class ScoreModel {
    static let shared = ScoreModel()
    private init() {}
    var humanWin: Int = 0
    var computerWin: Int = 0
}

enum ResultStatus {
    case none
    case equal
    case more
    case less
    case error
}
