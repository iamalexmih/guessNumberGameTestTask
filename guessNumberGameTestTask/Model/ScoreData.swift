//
//  ScoreData.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 24.01.2023.
//

import Foundation


class ScoreData {
    static let shared = ScoreData()
    private init() {}
    var humanWin: Int = 0
    var computerWin: Int = 0
}
